function A = tomatrix(v,r)
% convert a column matrix v to r rows
% v: input matrix
% r: number of rows of original matrix

    [~,m]=size(v);
    if (m ~= 1 )
        error('incorrect input dimension');
    end

    if (mod(length(v),r)~=0)
        error('incorrect row number');
    end

    A = reshape(v,r,length(v)/r);

end