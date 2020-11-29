# Assignment 1: Protests
The past few years in the United States, there has been a surge in protests in support of Black Lives Matter, gender equity, and other social issues. In this assignment, you'll work with data from [CountLove](https://countlove.org/) -- the same data often [cited](https://www.nytimes.com/2020/08/28/us/black-lives-matter-protest.html) by the New York Times -- to learn more about demonstrations over the past few years. 

By completing the assignment, you will demonstrate the following skills:

- Use of **version control** for managing your code
- Declaring document rendering using **markdown** syntax
- Foundational programming skills in R. 



## Background Research
Before diving into this (or any) dataset, it's important to have _domain familiarity_ (i.e., to know something about the topic). As preparation, I'm asking that you read **three articles** about protests in the U.S., and provide a brief 1 - 2 sentence summary or takeaway from each one. 

In the section below, create an **unordered list** of the three articles you found. Make sure to provide an appropriate markdown link (_not_ just the URL) to the article in addition to your 1 - 2 sentence summary. 

* "A week that shook a nation: anger burns as power of protests leaves Trump exposed"
    + This article speaks on the prevalence of the largest protests in the U.S. since the 1960s. With various participants such as George Floyd's death, Coronavirus, unemployment, a failing economy, and policy brutality and racism, Trump's contradictory approaches to solving these issues are evaluated.
    + [The Guardian](https://www.theguardian.com/us-news/2020/jun/06/america-george-floyd-protests-trump)
    
* "Police declare riots as protests turn violent in cities nationwide; 1 demonstrator dead in Austin"
    + In this article, the author describes the transition from peaceful protests to violent riots that have occurred throughout the country, specifying events that happened in Oregon, California, Washington, and Virginia. During this specification, the author describes the most violent events which occurred in each of these states. 
    + [ABC News](https://abcnews.go.com/US/police-declare-riots-protests-turn-violent-cities-nationwide/story?id=71994983) 
    
* "US must address deep-seated grievances to move beyond history of racism and violence"
    + One takeaway I have from this article is the importance behind breaking the deep cycle of harmful behavior that's occurring in the U.S. considering recent events of COVID-19 and police killings involved with the Black Lives Matter movement.
    + [UN News](https://news.un.org/en/story/2020/06/1065572)

## Accompanying Image 
In this section, please **display one image** to accompany your text, and describe _why_ you included it (~2 - 3 sentences). This will require that you download an image into your project folder. In your description, use **bold** and _italics_ (at least once, for practice) to emphasize some of your points. 

![I included this image because of it's prevlaence to my current location in Seattle, WA, and because of the power behind the artwork that has been created here during the _Black Lives Matter movement_. I chose this specific image because of my **passion for art**, and the message behind why this piece was created. This has been a year of hopeful change considering out current status as a country. When I learned about this piece, I was excited to see it in person and witness this work that many artists of color worked together to create and **send this message that needs to be heard**.](path/to/blacklivesmatter.jpg)

## Analysis
At this point, you should open up your `analysis.R` script to begin working with the data. The script will guide you through an initial analysis of the data. Throughout the script, there are prompts labeled **Reflection**. Please write 1 - 2 sentences for each of these reflections below:

- What does the difference between the mean and the median tell you about the *distribution* of the data?

The difference between the mean and median tells me that the data for 'num_attendees' has a *skewed distribution*. The median in this case would most likely be the best measure of central tendency as there is a wide range of attendees that attended the protests in the dataset. 

- Does the number of protests in Washington surprise you? Why or why not?

No, the number of protests in Washington doesn't surprise me because of how prevalent going to protests this year has been in the UW community. Since Seattle tends to be very active with current trends, and has a very large population that enjoys standing up for current issues, I expected there to be many protests in Washington. Since the total number of protests in Washington includes cities aside from Seattle, I was expecting this high number.

- Looking at the `state_table` variable, what data quality issues do you notice, and how would you use that to change your analysis (no need to actually change your analysis)?

Some quality issues that I notice in the 'state_table' are that some of the state abbreviations are lowercase. Additionally, some of the abbreviations have just one letter that is lowercase. This looks unprofessional and is confusing while looking at the table, as it looks like it's giving you different information since letters are not all visually the same. 

- Does the change in the number of protests from 2019 to 2020 surprise you? Why or why not?

No, the change in the number of protests from 2019 to 2020 does not surprise me because of the sequence of events that have happened since the beginning of 2020. With the crazy amount of issues brought to society's attention this year, I am not surprised that people have starting protesting more. Especially with the prevalence of the Black Lives Matter movement, and the political issues that are happening this year, the number of protests is very valid (especially considering how many people have strong opinions about the issues brought up this year).

- Do a bit of research. Find at least *two specific policies* that have been changed as a result of protests in 2020. These may be at the city, state, or University level. Please provide a basic summary, as well as a link to each article.

Due to 2020 protests, two policies that have changed include Denver's ban on chokeholds and a new requirement that SWAT officers "turn on their body cameras during tactical operations". These policies are at a state level in Colorado. Due to the prevalence of violence acted on by police officers and SWAT teams during protests over the course of the year, this change in policy is one step closer to hopefully limiting police brutality, especially towards innocent protestors. 
  + [Vox](https://www.vox.com/2020/6/10/21283966/protests-george-floyd-police-reform-policy) 

- Take a look (`View()`) your `high_level_table` variable. What picture does this paint of the U.S.?

Although I couldn't fully create the table (as I couldn't figure it out), I can imagine the number of protests for each "purpose". From my personal knowledge, the purposes for the protests that are most common are those that I am not personally surprised about. After organizing the data according to purpose in a table, I was able to see that the majority of these protests were for Civil Rights. This is not surprising considering the movements that have occurred just during 2020. 


## Final Thoughts
When you are finished, with your analysis, please answer the following questions in 1-2 sentences each. 

- What about the analysis surprised you?

Throughout this analysis, I was surprised by how many different areas of each state had protests. I hadn't considered the smaller towns that still had protests at smaller sizes. Throughout this year, I typically only think about bigger cities that hold protests for people from all over to attend. I hadn't considered these smaller cities, so this was something that surprised me while analyzing the data.

- What parts of this analysis did you find challenging?

Creating a higher level summary of the purpose of the protests was something I found very challenging. I wasn't able to fully complete this part as I couldn't figure it out. Figuring out how to extract everything except for the parentheses was very challenging and led me to give up. Additionally, trying to do some parts of the assignment were challenging at first, but I have learned a lot just through completing this assignment and found that tasks got easier as I went through.

- What types of analysis do you wish you were able to do with the dataset, but currently don't have the technical skills to do?

One type of analysis I wish I was able to do with the dataset is learn about the media influence that these protests had and how many of the participants influenced the prevalence of protest topics throughout the media. Another type of analysis I wish I was able to do is learn the familiarity participants had on the protest topic. Knowing this would give a lot of insight on what participants' influence looked like and how this affected others to attend because of media prevalence.