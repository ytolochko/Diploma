from pathlib import Path
import pandas
import geopandas
folder = Path("Data\\Shapefiles\\ADM1")
shapefiles = folder.glob("*.shp")
gdf = pandas.concat([geopandas.read_file(str(shp)) for shp in shapefiles])
gdf.to_file(folder / 'compiled.shp')