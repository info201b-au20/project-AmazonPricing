# Final Project
## Domain of interest

#### Why are you interested in this field/domain?

The domain that our group is most interested in is e-commerce. We’re interested in this field because of the prevalence this domain has in our current lives. This domain has a strong correlation with how technology is represented in our lives today. As a group, we wanted to work with data that was relevant to us so that we could gain a deeper understanding of the subject, in our case: retail and e-commerce. We are focusing on “Amazon’s anti-competitive practices and pricing”, as we found this data intriguing with consideration towards Amazon’s popularity and power within the e-commerce industry. By diving into this data set, we hope to learn more about the data Amazon primarily uses to their own advantage, as well as how they support merchants’ businesses.

#### What other examples of data driven projects have you found related to this domain (share at least 3)?

Data driven projects related to our domain, e-commerce, include easy online payments, product recommendation system, the Churn Model, and price optimization. These projects are used within e-commerce companies in order to understand their users in the best way possible and assure they will turn into repeat consumers. Easy online payments are an important factor with e-commerce to assure that user experience is seamless and safe. The product recommendation system also helps to improve user experience as it collects data about a user’s purchases and recommends products that the consumer may be interested in. The Churn model is another way to stay relevant in the industry as it uses several strategies to detect consumers that may additionally use different e-commerce platforms and take extra action steps to assure the consumer will return to use only their specific platform. Lastly, price optimization is an example of a data driven project related to e-commerce as it uses data to predict what price will be in the optimized range for consumers to return while allowing the company to receive the highest profit possible. <https://www.amaboston.org/blog/10-data-science-projects-e-commerce-businesses-are-using/>

#### What data-driven questions do you hope to answer about this domain (share at least 3)?

Throughout the course of this quarter, we hope to answer the following questions about our domain. We want to answer, “What percentage of the products at Amazon are sold from a third-party seller versus Amazon?”, “How does Amazon’s pricing algorithm help customers, third party sellers, and Amazon itself?”, and “What types of products does Amazon make themselves vs. what types of products do they prefer third party sellers for?”. In addition to these questions, we want to also look into how Amazon potentially manipulates the order of their products. Due to this goal, we also want to answer the questions: “Does Amazon rank their own products above similarly priced products sold by third party vendors?” and “Does amazon price their products lower than similar products sold by third party vendors?”. Through our analysis of this dataset, we hope to gain insight into what adjustments or data driven projects the company uses to set itself apart from additional e-commerce opportunities.

## Finding Data

### Source 1: Amazon product pricing

#### Where did you download the data?

We downloaded the data from the ProPublica Datastore from this link: <https://www.propublica.org/datastore/dataset/amazon-pricing-algorithm-data-set>

#### How was the data collected or generated? Make sure to explain who collected the data (not necessarily the same people that host the data).

ProPublica researchers wrote a software program to scrape data from Amazon’s website for 250 best selling products across a wide selection of categories. For each of these 250 products, the software program scraped data from the suggested product’s listing page as well as the other listings from other vendors offering the same product. For every product, the program collected the scraped price, and calculated the combined price plus shipping. Both of these prices are different columns in the data set.

#### Who or what the data is about?

The data is about the 250 best selling Amazon products across a wide selection of categories. The data was collected over several weeks in the summer of 2016. For each of these best selling products, the pricing and shipping costs offered by multiple different vendors are recorded as well as the index of how that product is ranked among similar products sold by other vendors.  

#### How many observations (rows) are in your data?

6972

#### How many features (columns) are in the data?

13

#### What questions (from above) can be answered using the data in this dataset?

  - How does Amazon’s pricing algorithm help customers, third party sellers, and Amazon itself?
  - Does Amazon rank their own products above similarly priced products sold by third party vendors?
  - Does amazon price their products lower than similar products sold by third party vendors.

### Source 2: Amazon predatory pricing

#### Where did you download the data?

<https://data.world/data-hut/predatory-pricing-data-from-amazon>

#### How was the data collected or generated? Make sure to explain who collected the data (not necessarily the same people that host the data).

The data was collected by employees at Datahut. Datahut is a cloud based data extraction platform that helps enterprises get structured data from websites with web scraping. On March 9, 2020, they used Datahut to scrape data from product listings for surgical masks on Amazon India. Datahut’s platform found 350 product listings of surgical masks, and 141 of them did not have pricing data because they were out of stock. They used the Talend data prep tool to remove these out of stock listings and clean the data.

#### Who or what the data is about?

The data is about the pricing of surgical masks on Amazon India in March 2020, during COVID-19. The data notes the date the product was first listed on Amazon, the MRP of the surgical mask, the sale price, and the discount percentage. The MRP, maximum retail price, is a manufacturer calculated price that is the highest price that can be charged for a product sold in India. All products sold in India must be marked with their MRP. On eCommerce sites like Amazon India, the sale price is usually a slightly discounted price from the MRP.  Nearly half of the surgical mask products have a discount of 50% or more. Amazon India was flagged for predatory pricing during COVID 19.  Predatory pricing, which is illegal in India, is the sale of products or services at a price below the cost of production, with a view to reduce or eliminate competition. This dataset helps provide insight into Amazon’s supposed “Predatory Pricing” practices during Covid-19 in India.

#### How many observations (rows) are in your data?

209

#### How many features (columns) are in the data?

12

#### What questions (from above) can be answered using the data in this dataset?

  - How does Amazon’s pricing algorithm help customers, third party sellers, and Amazon itself?
  - Does amazon price their products lower than similar products sold by third party vendors?

### Source 3: Amazon Product Dataset 2020 01/01/2020-01/31/2020

#### Where did you download the data?

This data was downloaded from the following website <https://data.world/promptcloud/amazon-product-dataset-2020/workspace/project-summary?agentid=promptcloud&datasetid=amazon-product-dataset-2020>

#### How was the data collected or generated? Make sure to explain who collected the data (not necessarily the same people that host the data).

This dataset was collected by teams at PromptCloud. Next, the data was cleaned and stored on DataStocks website. DataStock was started by PromptCloud in 2018 as a complete data warehousing software, where customers and clients can buy data in usable formats. The full dataset cost 400 dollars, so we are using a sample of the dataset that is hosted on data.world.

#### Who or what the data is about?

This dataset contains a sample of data about 10K Amazon products in January 2020 across a wide selection of categories. For each product, several important details are recorded such as the product name, brand name, category, selling price, and if the product is sold by Amazon or a third party seller.

#### How many observations (rows) are in your data?

10,002

#### How many features (columns) are in the data?

28

#### What questions (from above) can be answered using the data in this dataset?

  - What percentage of the products on Amazon are sold from a third-party seller versus by Amazon?
  - What types of products does Amazon make themselves vs what types of products do they prefer third party sellers for?
