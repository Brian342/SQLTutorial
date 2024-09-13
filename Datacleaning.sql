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
WHERE PropertyAddress is NULL
