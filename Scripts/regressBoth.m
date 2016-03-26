function [out1, out2] = regressBoth(inData)

half1 = inData(1:(length(inData)/2));
half2 = inData(((length(inData)/2)+1):end);

dep1 = half1(2:end);
indep1 = half1(1:end-1);
dep2 = half2(2:end);
indep2 = half2(1:end-1);

S = [1 1];
advOpt.distrib = 'Normal';
advOpt.std_method = 1;
advOpt.doPlots = 0;

out1 = MS_Regress_Fit(dep1, indep1, 2, S, advOpt)
out2 = MS_Regress_Fit(dep2, indep2, 2, S, advOpt) 

end


