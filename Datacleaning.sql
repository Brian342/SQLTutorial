--Cleaning Data in Sql Queries
SELECT *
FROM Portfolio_project.dbo.Nashvillehousing

--Standardize Date Format
SELECT SaleDateConverted, CONVERT(Date,saleDate)
FROM Portfolio_project.dbo.Nashvillehousing

update Nashvillehousing
SET SaleDate = CONVERT(Date,SaleDate)

ALTER TABLE Nashvillehousing
ADD SaleDateConverted Date;

update Nashvillehousing
SET SaleDateConverted = CONVERT(Date,SaleDate)


-- Populate property Address Data
SELECT *
FROM Portfolio_project.dbo.NashvilleHousing
--WHERE PropertyAddress is NULL
order by ParcelID

SELECT a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, ISNULL(a.PropertyAddress, b.PropertyAddress)
FROM Portfolio_project.dbo.NashvilleHousing a
join Portfolio_project.dbo.NashvilleHousing b
    on a.ParcelID = b.ParcelID
    and a.[UniqueID] <> b.[UniqueID]
where a.PropertyAddress is null

UPDATE a
SET PropertyAddress = ISNULL(a.PropertyAddress, b.PropertyAddress)
FROM Portfolio_project.dbo.NashvilleHousing a
join Portfolio_project.dbo.NashvilleHousing b
    on a.ParcelID = b.ParcelID
    and a.[UniqueID] <> b.[UniqueID]
where a.PropertyAddress is null


-- Breaking out Address into Individual columns (Address, City, State)

SELECT PropertyAddress
FROM Portfolio_project.dbo.NashvilleHousing

SELECT 
SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1) as Address
, SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress)+ 1, LEN(PropertyAddress)) as Address
FROM Portfolio_project.dbo.NashvilleHousing

ALTER TABLE NashvilleHousing
ADD PropertySplitAddress NVARCHAR(255);

update NashvilleHousing
SET PropertySplitAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',',PropertyAddress) -1)

ALTER TABLE NashvilleHousing
ADD PropertySplitCity NVARCHAR(255);

update NashVilleHousing
set PropertySplitCity = SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1, LEN(PropertyAddress))


SELECT *
FROM  Portfolio_project.dbo.NashvilleHousing


SELECT OwnerAddress
FROM  Portfolio_project.dbo.NashvilleHousing


select 
PARSENAME(Replace(OwnerAddress, ',','.'),3)
, PARSENAME(Replace(OwnerAddress, ',','.'),2)
, PARSENAME(Replace(OwnerAddress, ',','.'),1)
from Portfolio_project.dbo.NashvilleHousing


ALTER TABLE NashvilleHousing
ADD OwnerSplitAddress NVARCHAR(255);

update NashvilleHousing
SET OwnerSplitAddress = PARSENAME(Replace(OwnerAddress, ',','.'),3)


ALTER TABLE NashvilleHousing
ADD OwnerSplitCity NVARCHAR(255);

update NashVilleHousing
set OwnerSplitCity = PARSENAME(Replace(OwnerAddress, ',','.'),2)


ALTER TABLE NashvilleHousing
ADD OwnerSplitState NVARCHAR(255);

update NashVilleHousing
set OwnerSplitState = PARSENAME(Replace(OwnerAddress, ',','.'),1)


SELECT *
FROM  Portfolio_project.dbo.NashvilleHousing


-- change Y and N to Yes and No in 'sold as Vacant' field
SELECT DISTINCT (SoldAsVacant), COUNT(SoldAsVacant)
FROM Portfolio_project.dbo.NashvilleHousing
GROUP BY SoldAsVacant
ORDER BY 2


SELECT SoldAsVacant
, CASE WHEN SoldAsVacant = 'Y' THEN 'Yes'
        when SoldAsVacant = 'N' THEN 'No'
        ELSE SoldAsVacant
        END
FROM Portfolio_project.dbo.NashvilleHousing


UPDATE NashvilleHousing
SET SoldAsVacant = CASE WHEN SoldAsVacant = 'Y' THEN 'Yes'
        when SoldAsVacant = 'N' THEN 'No'
        ELSE SoldAsVacant
        END
FROM Portfolio_project.dbo.NashvilleHousing


-- Removing Duplicate
WITH RownumCTE AS(
SELECT *,
    ROW_Number() over (
        PARTITION BY ParcelID,
                     PropertyAddress,
                     SalePrice,
                     SaleDate,
                     LegalReference
                     ORDER  BY 
                        UniqueID

    ) row_num
FROM Portfolio_project.dbo.NashvilleHousing
-- order by ParcelID
-- WHERE row_num > 1
)
SELECT *
from RownumCTE
WHERE row_num > 1
-- order by PropertyAddress


SELECT *
FROM Portfolio_project.dbo.NashvilleHousing


-- Delete unused columns
SELECT *
FROM Portfolio_project.dbo.NashvilleHousing

ALTER TABLE Portfolio_project.dbo.NashvilleHousing
DROP COLUMN OwnerAddress, TaxDistrict, PropertyAddress

ALTER TABLE Portfolio_project.dbo.NashvilleHousing
DROP COLUMN SaleDate
 