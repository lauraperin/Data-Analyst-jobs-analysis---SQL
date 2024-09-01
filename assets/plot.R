library(ggplot2)
library(scales)
library(readr)

d1<- read_csv("1 top paying jobs.csv")

ggplot(d1, aes(x = reorder(job_title, salary_year_avg), y = salary_year_avg)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  coord_flip() +  
  labs(x = "Job Description", y = "Average salary ($)", title = "Average Salaries by Job Description") +
  theme_minimal() +
  scale_y_continuous(labels = comma, breaks = pretty_breaks(n = 10)) +  
  theme(
    axis.text.y = element_text(size = 10), 
    axis.text.x = element_text(size = 10),  
    axis.title.x = element_text(size = 12), 
    axis.title.y = element_text(size = 12) 
  )

d2 <- read_csv("2 top paying job skills.csv")
library(dplyr) 
skill_counts <- d2 %>%
  group_by(skills) %>%
  summarize(count = n()) %>%
  arrange(desc(count))

skill_counts<-skill_counts[1:10,]
# Create the bar plot
ggplot(skill_counts, aes(x = count, y = reorder(skills, count))) +
  geom_bar(stat = "identity", fill = "skyblue") +
  labs(x = "Skill Count", y = "Skills", title = "Frequency of Skills in top 10 paying jobs") +
  theme_minimal() +
  theme(
    axis.text.y = element_text(size = 12),  
    axis.text.x = element_text(size = 12),  
    axis.title.x = element_text(size = 13), 
    axis.title.y = element_text(size = 13) 
  )
