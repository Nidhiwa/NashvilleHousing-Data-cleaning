# NashvilleHousing-Data-cleaning


The dataset comprised housing data in the Nashville, TN region. Using SQL Server, I performed data cleansing to enhance its usability. This involved several actions, such as eliminating unnecessary timestamps from certain dates, filling in null values with relevant data, splitting address columns into separate columns for address, city, and state, ensuring consistent usage in a column with varied representations of the same data, eliminating duplicate rows, and removing any unused columns. These transformations were carried out to streamline and improve the overall quality of the data.

The dataset was sourced from Github(https://github.com/AlexTheAnalyst/PortfolioProjects/blob/main/Nashville%20Housing%20Data%20for%20Data%20Cleaning.xlsx), and initially published on Kaggle.

**METADATA:**

The dataset comprises 20 columns and 56,477 rows.

UniqueID — Identification number assigned to a buyer.
ParcelID — Code assigned to a piece of land.
LandUse — Indicates the various purposes for which the land is used.
SalesPrice — Cost of the land.
LegalReference — Refers to the citation and acknowledgment of authoritative documents and sources.
OwnerName — Name of the landowner.
Acreage — The size of the land area in acres.
LandValue — The assessed value of the land.
Building Value — The assessed value of any buildings on the land.
Total Value — The combined value of the land and its buildings.
YearBuilt — The year when the building was constructed.
FullBath — Refers to a bathroom containing a shower, bathtub, sink, and toilet.
HalfBath — Refers to a bathroom containing only a sink and a toilet.
Sale_Date — The date when the land was sold.
SaleAddress — Address of the sold land.
City — The location of the land.
Owner_Address — Address of the landowner's residence.
OwnerCity — The city where the landowner resides.
OwnerState — The state where the landowner is located.



Upon reviewing the dataset, it became apparent that data cleaning was necessary due to several issues:

The date format is not standardized.
Some rows in the PropertyAddress column are NULL.
The PropertyAddress column combines both the City and House Address in a single field.
The OwnerAddress column includes the state, city, and address within the same field.
The SoldAsVacant column contains "Y" and "N" instead of "Yes" or "No".
Duplicate rows need to be removed.
Certain columns are irrelevant for the analysis and should be deleted.

After carrying out the data cleaning, I was left with 56,373 rows and 21 columns
