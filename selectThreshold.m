function [bestEpsilon bestF1] = selectThreshold(yval, pval)

bestEpsilon = 0;
bestF1 = 0;
F1 = 0;
stepsize = (max(pval) - min(pval)) / 1000;
%going through a bunch of epsilon using labeled data to find the anomolies in the cross validation set.
for epsilon = min(pval):stepsize:max(pval)

    preds = (pval<epsilon);
    prec = sum(preds(yval == 1))/sum(preds);
    rec = sum(preds(yval == 1))/sum(yval);
    F1 = 2*prec*rec/(prec+rec);

    if F1 > bestF1
       bestF1 = F1;
       bestEpsilon = epsilon;
    end
end

end
