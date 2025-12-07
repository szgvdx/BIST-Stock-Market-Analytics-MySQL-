# BIST Banking Sector Performance Analysis (2020–2025)
#### A SQL-Based Project

## Project Overview

This project analyzes the historical performance of publicly listed banking stocks on Borsa Istanbul (BIST) from 2020 to 2025. The goal is to explore long-term growth behavior, volatility patterns, liquidity strength, and downside risks using SQL as the primary analytical tool. The findings provide a structured view of sector trends and investment characteristics based on measurable financial metrics.

## Data Source

The dataset was obtained from Kaggle: BIST Banking Stocks

It includes:
- Daily trading records for major Turkish banks
- OHLC pricing structure (Open, High, Low, Close)
- Adjusted close values
- Volume data
- Pre-calculated daily returns

#### Dataset Highlights:
- 11,250+ records
- Multi-instrument historical financial dataset

The raw file was provided as .csv, then imported for cleaning, transformation, and SQL analysis.


### Project Workflow
| Step                    | Description                                                                                   |
| ----------------------- | --------------------------------------------------------------------------------------------- |
| 1. Data Import          | Loaded dataset from `.csv` into SQL environment                                               |
| 2. Data Cleaning        | Fixed date format, converted text values to numeric types, handle null entries                |
| 3. Exploration          | Ran descriptive statistics and initial screening                                              |
| 4. Time-Series Analysis | Evaluated trends, return behavior, and market fluctuations                                    |
| 5. Performance Metrics  | Calculated Annualized volatility & returns, CAGR per stock, sharpe-like ratio (no risk-free rate)  |
| 6. Summary & Insights   | Highlighted patterns and potential strategic interpretations                                  |


### Analysis Sections
Each analysis was executed using SQL aggregation, window functions, ranking, and mathematical operators. Below are the summary result

1. Top Performing Stocks by CAGR (Compounded Annual Growth Rate)

<img width="975" height="439" alt="image" src="https://github.com/user-attachments/assets/f57ec1fb-88c4-4d8f-92b3-c3aa7ccb5390" />

Based on the CAGR results, Garanti BBVA stands out as the strongest performer and showing the fastest growth among the group likely driven by business expansion and strong market sentiment. İş Bankası and Yapı Kredi also delivered consistently high growth over the period, positioning them as solid long-term performers. Meanwhile, Akbank and T.S.K.B remain strong contenders as well, with CAGR levels that are still well above typical market averages.

2. Highest Volatility Stocks (Annualized)

<img width="975" height="558" alt="image" src="https://github.com/user-attachments/assets/344cef1a-c0c4-428a-b3bb-115b136b495e" />

Based on the annualized volatility results, the five most volatile stocks are Şekerbank, T.S.K.B, Yapı Kredi, Halk Bankası, and Vakıfbank. Their price movements are highly unstable, showing sharp daily fluctuations. This level of volatility often reflects factors such as strong market speculation, sensitivity to economic news, or high short-term trading activity. While high volatility can create opportunities for bigger gains, it also increases the risk of significant losses. Because of that, these stocks tend to be more suitable for aggressive investors who are focused on short-term momentum rather than long-term stability. They may work well for short-term trading strategies but are generally not ideal for passive long-term investors or anyone with a low risk tolerance. For those aiming for more stable growth, it’s advisable to combine volatility metrics with other indicators such as CAGR, trading volume trends, and moving average patterns before making decisions.

3. Maximum Drawdown (Worst Downside Risk)

<img width="975" height="478" alt="image" src="https://github.com/user-attachments/assets/3fdca59a-4b6b-4ddf-9d63-831a5049e6ae" />

The stocks with the steepest maximum drawdowns are Şekerbank, T.S.K.B, Halk Bankası, Vakıfbank, and Albaraka Turk. Maximum drawdown measures how far a stock has fallen from its highest point to its lowest point during the analysis period. A large negative value signals a high level of downside risk. For example, Şekerbank recorded a drawdown of around -67%, meaning an investor who bought at the peak could have lost more than two-thirds of their investment before any recovery, assuming the price eventually rebounds. These results suggest that these stocks experienced deep drops during certain market conditions, which may be linked to sentiment shifts, weaknesses in company fundamentals, or broader economic pressures affecting Turkey’s banking sector over the period.

4. Liquidity Ranking Based on Average Trading Volume

<img width="975" height="498" alt="image" src="https://github.com/user-attachments/assets/b090ea90-2045-4bcd-98be-b31f8b04ed36" />

Based on the average daily trading volume, the most liquid stocks are İş Bankası, Yapı Kredi, Şekerbank, Akbank, and T.S.K.B. Higher trading volume generally means the stock is easier to buy and sell because there are more active participants in the market. In practice, this allows investors to open or close positions faster without causing large price movements. Strong liquidity also suggests higher market interest, smoother price movements, and lower risk of slippage. Because of this, these stocks tend to work well for strategies that require flexibility and quick execution, such as day trading or swing trading.

While high liquidity is a positive indicator, it doesn’t always mean the stock is stable or low-risk. It’s still important to consider other metrics such as volatility, drawdown, and long-term performance before making investment decisions.

5. Extreme Negative Return Events

<img width="975" height="574" alt="image" src="https://github.com/user-attachments/assets/eac184e0-4c57-4d2f-a6fe-670027a86364" />

The analysis of the worst daily returns reveals clear risk-event patterns across several stocks. Şekerbank, T.S.K.B., Akbank, Halk Bankası, and Yapı Kredi all experienced sharp single-day drops of -10% or more, with the most extreme case being Şekerbank, which fell -20.83% on June 4, 2024. A drop of that size in just one day usually points to abnormal market conditions such as sudden negative sentiment, regulatory announcements, disappointing earnings, rumors, or panic selling. Stocks that frequently appear in these extreme drop lists, especially Şekerbank and T.S.K.B., tend to carry higher risk and require extra caution for anyone prioritizing portfolio stability. Identifying these extreme days helps flag stocks that are prone to unexpected volatility and serves as an important signal for risk management, especially for investors trying to avoid large drawdowns or those using stop-loss strategies.

These types of stocks may require tighter risk controls like stop-loss orders, smaller position sizes, or even hedging. Conservative investors may prefer stocks with fewer extreme downturns to maintain long-term stability. Meanwhile, short-term traders might see these volatile movements as opportunities for strategies such as mean reversion or volatility breakouts, depending on the market context.


### Closing note
This project showcases how SQL can be applied to financial markets analysis by transforming raw stock pricing data into measurable insights about performance, risk, and trading behavior. The methodology and findings may support investment hypothesis building, backtesting, and sector-level strategic interpretation.

Authored by: Sznvdx
Year: 2025
