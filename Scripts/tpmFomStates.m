occurance = full(sparse(y(1:end-1),y(2:end),1))

tpm = bsxfun(@rdivide,occurance,sum(occurance,2))