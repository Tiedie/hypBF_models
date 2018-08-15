%% Setup
x = [1:5];
y = [1 4 3 5 2];
H = zeros(length(x));

figure(1)
scatter(x,y)
shg

for i = 1:length(x)
    for j = 1:length(x)
        
        H(i,j) = norm(x(j)-x(i));
        % linear
%         const = 1;
%         H(i,j) = sqrt(norm(x(j)-x(i))^2+const^2);
%         % multiquadratic

    end
end

%% Interprelation

c = H^(-1)*y';

interps = zeros(1,41);
for val = 1:0.1:5
    
    temp = 0;
    
    for k = 1:length(x)
        temp = temp+ c(k)*norm(val-x(k));
       % linear 
       
%        temp = temp+ c(k)*sqrt(norm(val-x(k))^2+const^2);
%        % multiquadtratic 
       
       
       
    end
    
        interps(round(val*10-9)) = temp;

end
    
 
figure(2)
scatter(1:0.1:5,interps)
shg



%% Aproximation

c = (H + 1*eye(5))^(-1)*y';


interps = zeros(1,41);
for val = 1:0.1:5
    
    temp = 0;
    
    for k = 1:length(x)
        temp = temp+ c(k)*norm(val-x(k));
       % linear 
       
%        temp = temp+ c(k)*sqrt(norm(val-x(k))^2+const^2);
%        % multiquadtratic 
%        
       
       
    end
    
        interps(round(val*10-9)) = temp;

end
    
 
figure(3)
scatter(1:0.1:5,interps)
shg



%% Aproximation


noisyData = normrnd([interps],1);

figure(3)
scatter(1:0.1:5,noisyData)
shg

data_subset = noisyData(1:5:length(noisyData));
figure(4)
scatter(1:0.5:5,data_subset)
shg

x = [1:0.5:5];

for i = 1:length(x)
    for j = 1:length(x)
        
%         H(i,j) = norm(x(j)-x(i));
%         % linear
        const = 1;
        H(i,j) = sqrt(norm(x(j)-x(i))^2+const^2);
        % multiquadratic

    end
end

%%
c = H^(-1)*data_subset';

interps = zeros(1,41);
for val = 1:0.1:5
    
    temp = 0;
    
    for k = 1:length(x)
%         temp = temp+ c(k)*norm(val-x(k));
%        % linear 
       
       temp = temp+ c(k)*sqrt(norm(val-x(k))^2+const^2);
       % multiquadtratic 
       
       
       
    end
    
        interps(round(val*10-9)) = temp;

end
    
 
figure(5)
scatter(1:0.1:5,interps)
shg


%%


c = (H + 0.01*eye(9))^(-1)*data_subset';


aprox = zeros(1,41);
for val = 1:0.1:5
    
    temp = 0;
    
    for k = 1:length(x)
        temp = temp+ c(k)*norm(val-x(k));
       % linear 
       
%        temp = temp+ c(k)*sqrt(norm(val-x(k))^2+const^2);
%        % multiquadtratic 
%        
%        
       
    end
    
        aprox(round(val*10-9)) = temp;

end
    
 
figure(6)
scatter(1:0.1:5,aprox)
shg
