function [xi,yi,finterpmanual] = BiLinIntp(xgi,ygi,xg,yg,f2D)

% HW 4 Pb 2c

k = 1;

for l = 1 : length(xg)
    for m = 1 : length(yg)
        [i,j] = findij(xgi,xg(l),ygi,yg(m));
        if l > 1
            l1 = l -1;
            l2 = l;
        else
            l1 = l;
            l2 = l + 1;
        end % if
        if m > 1
            m1 = m - 1;
            m2 = m;
        else
            m1 = m;
            m2 = m + 1;
        end
        f = f2D(m1:m2,l1:l2);
        VM(k,:) = [l,m,i,j,f(1,1),f(1,2),f(2,1),f(2,2)];
        k = k + 1;
    end
end

for k = 1 : length(VM(:,1))
    i = VM(k,3);
    j = VM(k,4);
       if i > 1
        x = [xgi(i-1), xgi(i)];
       else
           x = [xgi(i), xgi(i+1)];
       end % if
       if j > 1
        y = [ygi(j-1), ygi(j)];
       else
        y = [ygi(j), ygi(j+1)];
       end % if
    [X,Y] = meshgrid(x,y);
    x1 = (x(1) + x(2))/2;
    y1 = (y(1) + y(2))/2;
    
    f = [VM(k,5),VM(k,6);VM(k,7),VM(k,8)];
    fvec = f(:);
    xvec = X(:);
    yvec = Y(:);
    M = [ones(4,1),xvec(:),yvec(:),xvec(:).*yvec(:)];
    [Mmod,order] = Gauss_elim(M,fvec);
    avec = backsub(Mmod(order,:));
    xi(i,:) = x1;
    yi(j,:) = y1;
    finterpmanual(j,i) = avec(1)+avec(2)*x1+avec(3)*y1+avec(4)*x1*y1;
end % for

end % function