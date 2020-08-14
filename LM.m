
% 計算函數f的雅克比矩陣，是解析式

syms a b y x real;

f=a*exp(-b*x);

Jsym=jacobian(f,[a b])

 

 

% 擬合用數據。參見《數學試驗》，p190，例2

data_1=[0.25 0.5 1 1.5 2 3 4 6 8];

obs_1=[19.21 18.15 15.36 14.10 12.89 9.32 7.45 5.24 3.01];

 

% 2. LM算法

% 初始猜測s

a0=10; b0=0.5;

y_init = a0*exp(-b0*data_1);

% 數據個數

Ndata=length(obs_1);

% 參數維數

Nparams=2;

% 迭代最大次數

n_iters=50;

% LM算法的阻尼系數初值

lamda=0.01;

 

% step1: 變量賦值

updateJ=1;

a_est=a0;

b_est=b0;

 

% step2: 迭代

for it=1:n_iters

    if updateJ==1

        % 根據當前估計值，計算雅克比矩陣

          J=zeros(Ndata,Nparams);

        for i=1:length(data_1)

              J(i,:)=[exp(-b_est*data_1(i)) -a_est*data_1(i)*exp(-b_est*data_1(i))];

        end

        % 根據當前參數，得到函數值

        y_est =   a_est*exp(-b_est*data_1);

        % 計算誤差

          d=obs_1-y_est;

        % 計算（擬）海塞矩陣

        H=J'*J;

        % 若是第一次迭代，計算誤差

        if it==1

              e=dot(d,d);

        end

    end

 

    % 根據阻尼系數lamda混合得到H矩陣

    H_lm=H+(lamda*eye(Nparams,Nparams));

    % 計算步長dp，並根據步長計算新的可能的\參數估計值

      dp=inv(H_lm)*(J'*d(:));

    g = J'*d(:);

      a_lm=a_est+dp(1);

      b_lm=b_est+dp(2);

    % 計算新的可能估計值對應的y和計算殘差e

    y_est_lm =   a_lm*exp(-b_lm*data_1);

      d_lm=obs_1-y_est_lm;

    e_lm=dot(d_lm,d_lm);

    % 根據誤差，決定如何更新參數和阻尼系數

    if e_lm<e

          lamda=lamda/10;

          a_est=a_lm;

          b_est=b_lm;

        e=e_lm;

        disp(e);

        updateJ=1;

    else

        updateJ=0;

          lamda=lamda*10;

    end

end

%顯示優化的結果

a_est

b_est
