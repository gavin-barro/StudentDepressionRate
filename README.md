# Student Depression Rate


1. Introduction
This study investigates the association between financial stress, work study hours, and gender with depression status among university students. The dataset contains 27,900 observations and originally included various demographic and psychosocial factors. For this study, only four variables were retained for analysis:
Quantitative:


Work Study Hours (Continuous variable representing the number of hours worked/studied, containing numbers 0-12)


Financial Stress (Continuous variable representing the financial stress level, containing integers 1-5)


Qualitative:


Gender (Categorical variable: Male/Female)


Depression (Binary categorical variable: 1 = Depressed, 0 = Not Depressed)
____________________________________________________________________________


2. Goals / Hypotheses
Main Goal: To investigate how different factors - specifically financial stress, work study hours, and gender-relate to depression among students in a large academic dataset.
Specific Objectives: 
Understand the relationship between financial stress and the likelihood of experiencing depression
Explore whether hours spent in work study programs are associated with depression levels
Examine if gender plays a role in the prevalence of depression
Why this Matters:
Student mental health is a growing concern in academic settings
Identifying key risk factors can help guide better support systems policy decisions and mental health interventions on campuses.
2.1 Hypothesis:
Hypothesis 1: Financial Stress
Null (H₀): There is no significant difference in financial stress between students who are depressed and those who are not.


Alternative (H₁): Students who are depressed report significantly higher financial stress than those who are not.
Hypothesis 2: Work Study Hours
Null (H₀): There is no significant difference in work study hours between students who are depressed and those who are not.


Alternative (H₁): Students who are depressed work significantly more hours in work study programs than those who are not.
Hypothesis 3: Gender
Null (H₀): There is no association between gender and depression.


Alternative (H₁): Depression rates differ significantly between male and female students.
____________________________________________________________________________
3. Model Assumptions
For t-tests:


Large sample size allows application of the Central Limit Theorem.


Welch’s t-test applied to allow for unequal variance.


Variables are either continuous or treated as such.


Observations are independent.


For logistic regression:


Dependent variable is binary.


Observations are independent.


Predictors are not highly collinear.


Logit of the outcome is a linear function of predictors.


Large sample size ensures model stability.

For Chi-Square Test Assumptions 
Categorical Variables: Both variables (Gender and Depression) are categorical.


Independence: Each observation is independent of others (no student is counted more than once).


Expected Frequencies: Expected counts in each cell of the contingency table should generally be ≥ 5.


Random Sampling: The data should come from a random or representative sample.



4. Descriptive Statistics
Quantitative Variables:
Variable
Min
1st Qu.
Median
Mean
3rd Qu.
Max
NAs
Financial Stress:
1
2
3
3.14
4
5
3
Work Study Hours:
0
4
8
7.16
10
12
0




Financial stress appears moderately high on average.


Work study hours average just over 7 hours/week, with higher values among depressed students.


Qualitative Variables
The qualitative variables when checked through R produced the following outputs:


(Distribution of Depressed vs. Not Depressed)
From these graphs we can infer that 55.7% of the people observed were male whilst the other 44.3 percent were female and that 58.5% were depressed while the other 41.5% were not. 

5. Inferential Statistics and Model Presentation
Hypothesis 1:
Hypothesis: Higher financial stress increases the likelihood of depression among students
Findings:
Financial Stress Effect: Each unit increases in financial stress raises the odds of depression
~73.9% (odds ratio 1.739, p < 0.001), strongly supporting the hypothesis
Statistical Significance: financial stress is highly sufficient (p < 2e-16) confirming a robust association with depression
Model Fit: Financial stress explains substantial variability in depression 
Deviance reduced by 3,82, improving model fit (AIC = 34,038) 
Implication: Higher financial stress is a significant risk factor for depression, suggesting interventions like financial aid could help reduce depression among students





*The T-test proves that we were able to run this regression model
____________________________________________________________________
Hypothesis 2:
Hypothesis: Higher work study hours increase the likelihood of depression among students
Findings:
Effect: each additional hour of work-study increase the odds of depression by ~12.3 (odds ratio = 1.123, p< 0.001) which supports the hypothesis
Statistical Significance: Work-study hours are highly significant (p < 2e-166) confirming a strong association with depression
Model Fit: Work-study hours explain some variability in depression (deviance reduced by 1,218) improving model fit (AIC = 36,515)
Implication: More work-study hours are a significant risk factor for depression, suggesting that reducing work study demands could help lower depression rates among students






*The T-test proves that we were able to run this regression model
______________________________________________________________________
Hypothesis 3:
Hypothesis:  Being male increases the likelihood of depression among students 
Findings:
Effect: Being male increases the odds of depression by ~0.7% (odds ratio = 1.007, p = 0.764), but the effect is negligible and not significant
Failing to support the hypothesis 
Statistical Significance: Gender is not significant (p = 0.764) indicating no association with depression
Model Fit: Gender does not explain any variability in depression showing no improvement over a null model
Implication: Gender is not a meaningful risk factor for depression among students
Suggests other factors should be prioritized





*Chi-Square allows the regression model to be run
______________________________________________________________________
Testing all together in a single regression model: 
Hypothesis: Being male, higher financial stress, and more work-study hours increase the likelihood of depression among students
Findings:
Gender/Male Effect: Being male increases the odds of depression by ~0.6% 
Financial Stress Effect: Each unit increase in financial stress raises the odds of depression by ~74.0% 
Work Study Hours Effect: Each additional hour of work-study increases the odds of depression by ~12.3% 
Statistical Significance: Financial stress and work-study hours are highly significant, while gender is not 
Model Fit: The model explains substantial variability in depression with financial stress and work-study hours driving the improvement
Implication: Higher financial stress and more work-study hours are significant risk factors for depression among students, warranting interventions like financial aid and reduced work demands




6. Model Diagnostics
Accuracy: The model correctly classified approximately 60.06% of observations.
 This indicates moderate predictive ability, but not strong.
Pseudo R² (McFadden's): The model had a pseudo R² value of 0.129, suggesting that about 12.9% of the variation in depression status is explained by Gender, Financial Stress, and Work Study Hours.
Limitation: The model’s predictive power is relatively low and may benefit from additional predictors or better data cleaning.
Confusion Table made on gender and depression: 
         Actual
Predicted     0     1
        0  6365  3466
        1  5198 12869
Summary:
Model performs reasonably well at identifying depression based on gender, financial stress, and work study hours.


However, the false positive rate is high—potentially labeling healthy individuals as depressed.


Improvement Ideas:


Adjust classification threshold (currently 0.5).


Add more predictors or use a different model.


Evaluate sensitivity and specificity to fine-tune accuracy.
Residual Plots for Financial Stress and Work Study Hours when compared to depression:

The two residual plots mostly support our usage of financial stress and work study hours as predictures but the slight curvature on both graphs suggests the relationships between financial stress and the log-odds of the outcome may not be perfectly linear. We might consider using splines in the future to better explore the relationships. 

7. Conclusion
This study investigated how financial stress and work-study hours relate to depression among college students using logistic regression.


Results showed that financial stress was a significant predictor of depression, indicating that students with higher levels of financial stress were more likely to experience depressive symptoms.


In contrast, work-study hours were not significantly associated, suggesting that the number of hours worked alone may not be a direct driver of depression.


These findings reinforce the idea that subjective financial strain, rather than objective workload, has a stronger impact on student well-being.


The analysis contributes to growing evidence that financial stress is a key risk factor for mental health challenges in higher education settings.


Targeted interventions addressing financial anxiety and access to resources could be effective in reducing depression risk.
Limitations:
Sample Size & Scope: The dataset was limited in size and only included a specific population, which may limit generalizability.


Binary Outcome: Depression was treated as a binary variable (1 = Depressed, 0 = Not Depressed), which may oversimplify the complexity of mental health.


Unmeasured Confounders: Other important factors (e.g., social support, academic stress, pre-existing mental health conditions) were not included in the model.


Cross-Sectional Data: The data was cross-sectional, preventing us from making causal inferences between financial stress and depression.


Self-Reported Measures: Financial stress and depression were based on self-report, which can introduce reporting bias.


Future Improvements:
Include psychosocial and academic stressors in the model.


Apply cross-validation for better generalizability.


Explore advanced models (e.g., decision trees, random forest, or neural networks) to enhance predictive performance.
