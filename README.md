# ETL - Tepuy Burger

## **About Tepuy Burger**
Tepuy Burger is a hamburger chain created in 2017. After an organic and constant growth based on the quality of their burgers, today it has 3 restaurants in Alicante & Benidorm, and expects to extend their business in the next months.

## **Software Issues**
Based in their not expected growth, this enterprise today manages its business with several softwares that have nothing to do with each other:
- Otter – To manage delivery services for three of the delivery apps.
- Deliverect – To manage delivery services for one of the delivery apps. It came after Otter, so they repeat some of the information.
- Gloria foods – Restaurant order system
- Tipsi – TPV system to manage orders
- Cover manager – Software to manage table reservations
- Mapal reputation – To manage delivery and eat in reviews.

## **Project Main Objective**
As a strong growth is expected in the short term, the enterprise is trying to join and understand all the information from the SW platforms, and this project aims to integrate in one single database the delivery information from different applications (Glovo, Uber eats, Just Eat, and own web). This is a small part of the total integration project of all their products and systems.

## **Project Development**

### *EXTRACTION*
#### ***Data Extraction***
- **Step 1** – Information extraction (Glovo, Uber Eats, and Tepuy web delivery information webscraping from the Otter client interface)
  - Related document: [I.Data_Extraction.ipynb](/src/Jupyter_Notebook/I.Data_Extraction.ipynb)
- **Step 2** – Information extraction (Just Eat information extraction from a CSV file)

### *TRANSFORM*
#### ***Data Cleaning***
- Related document: [II.Data_Cleaning.Ipynb](/src/Jupyter_Notebook/I.Data_Cleaning.ipynb)

#### ***Data Unification***
- Related document: [III.Data_Unification.ipynb](/src/Jupyter_Notebook/I.Data_Unification.ipynb)

#### ***Database Analysis***
- Related document: [IV.Database.ipynb](/src/Jupyter_Notebook/I.Data_Unification.ipynb)

### *LOADING*
#### ***Database Filling***
- Related document: [V.Database_filling.ipynb](/src/Jupyter_Notebook/I.Database_filling.ipynb)

#### ***ERD***
![ERD Image](/img/ERD.png)s