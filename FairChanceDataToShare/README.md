# README: Fair Chance Hiring Policy Indices

## Contents
- `PositiveIndex.csv`
- `NegativeIndex.csv`
- `FairChancePolicyIndexMetadata.csv`

## Positive Policy Indices

We focus on five key policies commonly considered beneficial for job-seekers with records:
- **Ban-the-box laws**
- **Laws that reduce barriers to occupational licensing**
- **Record-clearing laws**
- **Certificates of rehabilitation**
- **Business liability protections**

For each policy type, we collect data and create a metric, with **1 representing the strongest policy and 0 representing the weakest**. We then calculate the **Positive Policy Index** as the average of these five policy metrics.

## Negative Policy Indices

We also capture and quantify the impact of various legal and regulatory barriers that can restrict a person’s ability to find employment. For each state, we compute the **Negative Policy Index**, the primary measure of **punitive employment policies**.  

This index combines two underlying measures:
1. **Negative Policy Count** – the total number of employment-related restrictions in a state.
2. **Average Negative Policy Strength** – the typical severity of those restrictions.

By multiplying these two measures, the **Negative Policy Index** captures both the prevalence and intensity of restrictive policies, offering a **comprehensive assessment** of how state-level policies impact employment opportunities for individuals with criminal records.

## Metadata

Further details on the data acquisition and processing are available in the **`FairChancePolicyIndexMetadata.csv`** file.

## Acknowledgements

QSIDE has partnered with the **Responsible Business Initiative for Justice (RBIJ)** and **Jobs for the Future (JFF)** to build a **robust research framework** identifying effective practices for hiring people with criminal records.

This work is made possible through this partnership and is supported by **The Justice and Mobility Fund**, a collaboration launched by **The Ford Foundation** and **Blue Meridian Partners**, with support from **The Charles and Lynn Schusterman Family Philanthropies**.

We express our gratitude to our community partners, the **Responsible Business Initiative for Justice** and **Jobs for the Future**. Their insights, wisdom, and partnership have proved invaluable in this work.
