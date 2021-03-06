data {
  int T;         // データ取得期間の長さ
  vector[T] y;   // 観測値
}

parameters {
  vector[T] mu;       // 状態の推定値(水準成分)
  real<lower=0> s_w;  // 過程誤差の標準偏差
  real<lower=0> s_v;  // 観測誤差の標準偏差
}

model {
  // 状態方程式に従い、状態が遷移する
  mu[2:T] ~ normal(mu[1:T-1], s_w);
  
  // 観測方程式に従い、観測値が得られる
  y ~ normal(mu, s_v);
}
