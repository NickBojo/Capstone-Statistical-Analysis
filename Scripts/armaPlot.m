function [out] = armaPlot(inData, fileName, inAR, inMA)

out = armax(inData, [inAR inMA]);

residuals = resid(out,inData);

% Print Residuals, 99% Confidence Intervals / Autocorrelation
[xc lags] = xcorr(residuals, 50, 'coeff');
conf99 = sqrt(2)*erfcinv(2*0.01/2);
lconf = -conf99/sqrt(length(residuals));
upconf = conf99/sqrt(length(residuals));

plot = figure, stem(lags,xc);

set(gca,'ylim',[lconf-0.12 1.05]);
hold on;
line(lags,lconf*ones(size(lags)),'color','r','linewidth',2);
line(lags,upconf*ones(size(lags)),'color','r','linewidth',2);

titlename = ['ARMA Autocorrelation: ' fileName];
title(titlename);

outname = ['ARMA' fileName '.jpg']
saveas(plot,outname)

end

