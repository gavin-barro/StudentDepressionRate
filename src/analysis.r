# Authors: Gavin Barro, Jack Bresnahan, and Nathan Carter
# Dataset: https://www.kaggle.com/datasets/adilshamim8/student-depression-dataset 

library(readr)
path <- Sys.getenv()
student_depression_dataset <- read_csv(path)
View(student_depression_dataset)

data = student_depression_dataset
data$id = NULL
data$City = NULL
data$Profession = NULL
data$Academic.Pressure = NULL
data$Work.Pressure = NULL
data$Study.Satisfaction = NULL
data$Job.Satisfaction = NULL
data$Sleep.Duration = NULL
data$Dietary.Habits = NULL
data$Degree = NULL
data$Have.you.ever.had.suicidal.thoughts..=NULL
data$Family.History.of.Mental.Illness = NULL
data$Age = NULL
data$CGPA = NULL
head(data)
attach(data)

data$Financial.Stress <- as.numeric(as.character(data$Financial.Stress))
t.test(Financial.Stress ~ Depression, data = data)

data$Work.Study.Hours <- as.numeric(as.character(data$Work.Study.Hours))
t.test(Work.Study.Hours ~ Depression, data = data)

# Create contingency table
table_gender_depression <- table(data$Gender, data$Depression)

# Display the table
table_gender_depression

# Run Chi-square test
chisq.test(table_gender_depression)


# Descriptive statistics for quantitative variables
summary(data$Financial.Stress)
summary(data$Work.Study.Hours)

# Descriptive statistics for qualitative variables
table(data$Gender)
prop.table(table(data$Gender))

table(data$Depression)
prop.table(table(data$Depression))

# Histograms
hist(data$Financial.Stress, main = "Financial Stress Distribution", 
     xlab = "Financial Stress")
hist(data$Work.Study.Hours, main = "Work Study Hours Distribution",
     xlab = "Work Study Hours")

# Bar plot
barplot(table(data$Gender), main = "Gender Distribution")
barplot(table(data$Depression), main = "Depression Distribution")

model_fs <- glm(Depression ~ Financial.Stress, data = data, 
                family = "binomial")
summary(model_fs)

model_wsh <- glm(Depression ~ Work.Study.Hours, data = data, 
                 family = "binomial")
summary(model_wsh)

model_gender <- glm(Depression ~ Gender, data = data, family = "binomial")
summary(model_gender)

model <- glm(Depression ~ Gender + Financial.Stress + Work.Study.Hours, 
             data = data, family = "binomial")
summary(model)

# Example for model_fs (Financial Stress)
ll_model <- logLik(model_fs)
ll_null <- logLik(glm(Depression ~ 1, data = data, family = "binomial"))  
# null model

pseudo_r2 <- 1 - as.numeric(ll_model / ll_null)
pseudo_r2

# Predicted probabilities and classification (example with model_fs)
pred_probs <- predict(model_fs, type = "response")
pred_class <- ifelse(pred_probs > 0.5, 1, 0)
actual <- as.numeric(as.character(data$Depression))

# Confusion matrix
table(Predicted = pred_class, Actual = actual)

# Accuracy
mean(pred_class == actual)


# 2. Pseudo R² (McFadden's)
ll_model <- logLik(model)
ll_null <- logLik(glm(Depression ~ 1, data = data, family = "binomial"))
pseudo_r2 <- 1 - as.numeric(ll_model / ll_null)
pseudo_r2
