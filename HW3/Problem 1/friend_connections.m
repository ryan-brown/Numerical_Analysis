function n = friend_connections(A, a, b)
    X = A;
    for i = 1:100
        friend = X(a,b);
        if friend > 0
            n = i;
            break;
        end
        X = X*A;
    end
end