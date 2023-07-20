
SELECT * FROM [Nashville Housing Data for Data Cleaning (reuploaded)]

SELECT SaleDate, CONVERT(DATE,SaleDate) FROM [Nashville Housing Data for Data Cleaning (reuploaded)]

SELECT * FROM [Nashville Housing Data for Data Cleaning (reuploaded)] ORDER BY ParcelID

SELECT A.ParcelID,A.PropertyAddress,B.ParcelID,B.PropertyAddress, ISNULL(A.PropertyAddress,B.PropertyAddress) AS NEWADDRESS
FROM [Nashville Housing Data for Data Cleaning (reuploaded)] A 
JOIN  [Nashville Housing Data for Data Cleaning (reuploaded)] B
ON A.ParcelID = B.ParcelID
AND A.UniqueID <>B.UniqueID
WHERE A.PropertyAddress IS NULL

UPDATE A SET PropertyAddress=ISNULL(A.PropertyAddress,B.PropertyAddress) FROM [Nashville Housing Data for Data Cleaning (reuploaded)] A 
JOIN  [Nashville Housing Data for Data Cleaning (reuploaded)] B
ON A.ParcelID = B.ParcelID
AND A.UniqueID <>B.UniqueID
WHERE A.PropertyAddress IS NULL

SELECT PropertyAddress FROM [Nashville Housing Data for Data Cleaning (reuploaded)]

SELECT SUBSTRING(PropertyAddress,1,CHARINDEX(',',PropertyAddress)-1) FROM [Nashville Housing Data for Data Cleaning (reuploaded)]

SELECT SUBSTRING(PropertyAddress,1,CHARINDEX(',',PropertyAddress)-1) AS ADDRESS, SUBSTRING(PropertyAddress,CHARINDEX(',',PropertyAddress)+1,LEN(PropertyAddress)) 
FROM [Nashville Housing Data for Data Cleaning (reuploaded)]

ALTER TABLE [Nashville Housing Data for Data Cleaning (reuploaded)]
ADD ADDSPLIT NVARCHAR(255);

UPDATE [Nashville Housing Data for Data Cleaning (reuploaded)] SET ADDSPLIT = SUBSTRING(PropertyAddress,1,CHARINDEX(',',PropertyAddress)-1);

ALTER TABLE [Nashville Housing Data for Data Cleaning (reuploaded)]
ADD ADDSPLITCITY NVARCHAR(255);

UPDATE [Nashville Housing Data for Data Cleaning (reuploaded)] SET ADDSPLITCITY = SUBSTRING(PropertyAddress,CHARINDEX(',',PropertyAddress)+1,LEN(PropertyAddress)) ;

SELECT ADDSPLIT,ADDSPLITCITY FROM [Nashville Housing Data for Data Cleaning (reuploaded)]

Select OwnerAddress
From [Nashville Housing Data for Data Cleaning (reuploaded)]

Select
PARSENAME(REPLACE(OwnerAddress,',','.'), 3),
PARSENAME(REPLACE(OwnerAddress,',','.'), 2),
PARSENAME(REPLACE(OwnerAddress,',','.'), 1)

From [Nashville Housing Data for Data Cleaning (reuploaded)]

ALTER TABLE [Nashville Housing Data for Data Cleaning (reuploaded)]
Add OwnerSplitAddress Nvarchar(255);

Update [Nashville Housing Data for Data Cleaning (reuploaded)]
SET OwnerSplitAddress = PARSENAME(REPLACE(OwnerAddress, ',', '.') , 3)


ALTER TABLE [Nashville Housing Data for Data Cleaning (reuploaded)]
Add OwnerSplitCity Nvarchar(255);

Update [Nashville Housing Data for Data Cleaning (reuploaded)]
SET OwnerSplitCity = PARSENAME(REPLACE(OwnerAddress, ',', '.') , 2)



ALTER TABLE [Nashville Housing Data for Data Cleaning (reuploaded)]
Add OwnerSplitState Nvarchar(255);

Update [Nashville Housing Data for Data Cleaning (reuploaded)]
SET OwnerSplitState = PARSENAME(REPLACE(OwnerAddress, ',', '.') , 1)


Select *
From [Nashville Housing Data for Data Cleaning (reuploaded)]

SELECT DISTINCT(SOLDASVACANT) FROM [Nashville Housing Data for Data Cleaning (reuploaded)]

Select SoldAsVacant
, CASE When SoldAsVacant = 'Y' THEN 'Yes'
	   When SoldAsVacant = 'N' THEN 'No'
	   ELSE SoldAsVacant
	   END
From [Nashville Housing Data for Data Cleaning (reuploaded)]

UPDATE [Nashville Housing Data for Data Cleaning (reuploaded)] SET SoldAsVacant = 
CASE When SoldAsVacant = 'Y' THEN 'Yes'
	   When SoldAsVacant = 'N' THEN 'No'
	   ELSE SoldAsVacant
	   END

       SELECT SoldAsVacant FROM [Nashville Housing Data for Data Cleaning (reuploaded)]

       WITH RowNumCTE AS(
Select *,
	ROW_NUMBER() OVER (
	PARTITION BY ParcelID,
				 PropertyAddress,
				 SalePrice,
				 SaleDate,
				 LegalReference
				 ORDER BY
					UniqueID
					) row_num

From [Nashville Housing Data for Data Cleaning (reuploaded)]
--order by ParcelID
)
DELETE
From RowNumCTE
Where row_num > 1
--Order by PropertyAddress


ALTER TABLE [Nashville Housing Data for Data Cleaning (reuploaded)]
DROP COLUMN OwnerAddress, TaxDistrict, PropertyAddress, SaleDate
