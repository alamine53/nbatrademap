library("magick")
library('grid')

a <- image_read(trademap)
b <- image_read(tradebar)


d<-image_blank(450,660)

the_frame<-d
  for(i in 2:440){
  the_frame<-c(the_frame,d)
}


new_gif<-image_append(c(a[1], b[1]))
for(i in 2:440){
  combined <- image_append(c(a[i], b[i]))
  new_gif<-c(new_gif,combined)
}

new_gif