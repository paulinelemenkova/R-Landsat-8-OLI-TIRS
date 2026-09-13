# R Landsat 8 OLI/TIRS Image Processing

An R script demonstrating the loading, inspection and visualisation of a
Landsat 8 OLI/TIRS multispectral scene with the raster / sp / rgdal stack. The
worked example uses a scene over the Rio Piranhas region of Brazil (path/row
215064).

## Script

### Landsat_Brasil_Rio_Piranhas.r
- Reads the seven Landsat 8 GeoTIFF bands (readGDAL / raster), and inspects the
  spatial structure of a band: grid topology (cell-centre offset, 30 m cell
  size, dimensions), bounding box and coordinate reference system (UTM zone 24,
  WGS84).
- Plots individual bands (e.g. the near-infrared band 5), a frequency histogram
  of NIR reflectance (digital-number values) and a break-classified reflectance
  map (terrain colours over defined DN class breaks).
- Stacks the seven bands into a multi-band RasterStack and renders composites:
  a true-colour composite (RGB = bands 4-3-2) and a false-colour composite
  (RGB = bands 5-4-3), each with a linear contrast stretch.

## Methods and techniques

- Multispectral raster I/O and metadata inspection (grid, CRS, extent) with sp /
  rgdal / raster.
- Single-band visualisation, reflectance histogram and class-break mapping.
- Multi-band stacking and true-/false-colour composite generation with linear
  contrast stretching (plotRGB).

## Data

- Landsat 8 OLI/TIRS Collection 2 Level-1 scene
  (LC08_L1TP_215064_20210522_...), seven bands, Rio Piranhas, Brazil. The GeoTIFF
  bands are expected in the working directory and are not stored in this
  repository.

## Requirements

- R (>= 4.0); packages: raster, sp, rgdal

## Usage

Place the Landsat bands in the working directory and run:

    Rscript Landsat_Brasil_Rio_Piranhas.r

## Author

Polina Lemenkova
ORCID: https://orcid.org/0000-0002-5759-1089

## License

MIT - see the LICENSE file (Copyright Polina Lemenkova).
