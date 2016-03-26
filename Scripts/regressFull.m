function [out] = regressFull(inData, fileName)

dep = inData(2:end);
indep = inData(1:end-1);

S = [1 1];
advOpt.distrib = 'Normal';
advOpt.std_method = 1;
advOpt.doPlots = 0;

out = MS_Regress_Fit(dep, indep, 2, S, advOpt)

resid = out.resid;

% Print Residuals, 99% Confidence Intervals / Autocorrelation
[xc lags] = xcorr(resid, 50, 'coeff');
conf99 = sqrt(2)*erfcinv(2*0.01/2);
lconf = -conf99/sqrt(length(resid));
upconf = conf99/sqrt(length(resid));

plot = figure, stem(lags,xc);
set(gca,'ylim',[lconf-0.12 1.05]);
hold on;
line(lags,lconf*ones(size(lags)),'color','r','linewidth',2);
line(lags,upconf*ones(size(lags)),'color','r','linewidth',2);

titlename = ['MSRegress Autocorrelation: ' fileName];
title(titlename);

outname = ['MsRegress' fileName '.jpg']
saveas(plot,outname)

end

