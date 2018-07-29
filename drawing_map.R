install.packages('ggmap')
install.packages('rworldmap')


library(mapproj)
map <- get_map(location = 'Europe', zoom = 4, maptype = 'hybrid')
ggmap(map)

library(rworldmap)
newmap <- getMap(resolution = "low")
plot(newmap)


m<-get_map(location=c(lon=24, lat=1), zoom=5, color="bw")
ggmap(m)



aid <- read.csv('C:\\Users\\Yurii\\Desktop\\Konstanz stuff\\Diploma\\Data\\aid_data\\data\\level_1a.csv')
aid$log_commitments <- log(aid$even_split_commitments)
aid$transactions_start_year <-  as.factor(aid$transactions_start_year)

conflict <- read.csv('C:\\Users\\Yurii\\Desktop\\Konstanz stuff\\Diploma\\Data\\conflict_data\\DRC_2.csv')

names(conflict)


install.packages('maptools')
library('maptools')
library('ggmap')

shpfile <- 'C:\\Users\\Yurii\\Desktop\\Konstanz stuff\\Diploma\\Data\\gadm36_COD_shp\\gadm36_COD_1.shp'
sh <- readShapePoly(shpfile)
plot(sh)

points <- fortify(sh)

drc <- qmap('DRC', zoom = 5)

drc + geom_polygon(aes(x = long, y = lat, group=group), data = points, fill = 'white') +
  geom_polygon(aes(x=long,y=lat, group=group), data=points, color='black', fill=NA) + 
  geom_point(aes(x = longitude, y = latitude, size = log_commitments), data = aid)

drc + geom_polygon(aes(x = long, y = lat, group=group), data = points, fill = 'white') +
  geom_polygon(aes(x=long,y=lat, group=group), data=points, color='black', fill=NA) + 
  geom_point(aes(x = longitude, y = latitude, size = even_split_commitments, color = transactions_start_year), data = aid) +
  scale_size(range = c(1,12))

drc + geom_polygon(aes(x = long, y = lat, group=group), data = points, fill = 'white') +
  geom_polygon(aes(x=long,y=lat, group=group), data=points, color='black', fill=NA) + 
  geom_point(aes(x = longitude, y = latitude, size = best_est, color = year), data = conflict) +
  scale_size(range = c(1,12))


shpfile <- 'C:\\Users\\Yurii\\Desktop\\Konstanz stuff\\Diploma\\Data\\Shapefiles\\ADM1\\compiled.shp'
sh <- readShapePoly(shpfile)
plot(sh)
points <- fortify(sh)

qmap('Africa', zoom = 4) +
geom_polygon(aes(x = long, y = lat, group=group), data = points, fill = 'white') +
geom_polygon(aes(x=long,y=lat, group=group), data=points, color='black', fill=NA)

