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
