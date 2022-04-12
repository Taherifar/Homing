function RL = IMUOrient2Body(Config)


if strcmp(Config(3),'x')
    if strcmp(Config(1),'-z')
        gamma = 0;
    elseif strcmp(Config(1),'y')
        gamma = -pi/2;
    elseif strcmp(Config(1),'z')
        gamma = pi;
    elseif strcmp(Config(1),'-y')
        gamma = pi/2;
    end
    beta = -pi/2;
    alpha = 0;
    
elseif strcmp(Config(3),'-x')
    if strcmp(Config(1),'z')
        gamma = 0;
    elseif strcmp(Config(1),'y')
        gamma = -pi/2;
    elseif strcmp(Config(1),'-z')
        gamma = pi;
    elseif strcmp(Config(1),'-y')
        gamma = pi/2;
    end
    beta = pi/2;
    alpha = 0;
    
elseif strcmp(Config(3),'-y')
    if strcmp(Config(1),'x')
        gamma = 0;
    elseif strcmp(Config(1),'z')
        gamma = -pi/2;
    elseif strcmp(Config(1),'-x')
        gamma = pi;
    elseif strcmp(Config(1),'-z')
        gamma = pi/2;
    end
    alpha = -pi/2;
    beta = 0;
    
elseif strcmp(Config(3),'y')
    if strcmp(Config(1),'x')
        gamma = 0;
    elseif strcmp(Config(1),'-z')
        gamma = -pi/2;
    elseif strcmp(Config(1),'-x')
        gamma = pi;
    elseif strcmp(Config(1),'z')
        gamma = pi/2;
    end
    alpha = pi/2;
    beta = 0;
    
elseif strcmp(Config(3),'-z')
    if strcmp(Config(1),'x')
        gamma = 0;
    elseif strcmp(Config(1),'y')
        gamma = -pi/2;
    elseif strcmp(Config(1),'-x')
        gamma = pi;
    elseif strcmp(Config(1),'-y')
        gamma = pi/2;
    end
    alpha = pi;
    beta = 0;
    
elseif strcmp(Config(3),'z')
    if strcmp(Config(1),'x')
        gamma = 0;
    elseif strcmp(Config(1),'-y')
        gamma = -pi/2;
    elseif strcmp(Config(1),'-x')
        gamma = pi;
    elseif strcmp(Config(1),'y')
        gamma = pi/2;
    end
    alpha = 0;
    beta = 0;
else
    gamma = 0;
    alpha = 0;
    beta = 0;
end

RL = rot(3,gamma,3)*rot(2,beta,3)*rot(1,alpha,3);

end

