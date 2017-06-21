## tuberculosis
tub<-read.csv("C:/Users/Jose/Documents/Master Data Science/20170113/tb.csv", header = TRUE, sep = ",")
tb< melt(tub, id.vars = c("iso2","year"))
tb<- tb[tb$variable !="new_sp",]
tub.pais.ano<-melt(dcast(tb, iso2~ year, sum, na.rm = T))
tb$variable <-factor(tb$variable)
tb$variable<-gsub("(m|f)([0-9u]*)", "\\1;\\2", tb$variable)
tb<cbind(tb,colsplit(tb$variable, ";", c("sexo","edad")))
respuesta2<-dcast(tb, iso2 + year ~ sexo, sum, na.rm = T, value.var = "value")
respuesta3<-dcast(tb, iso2 + year ~ edad, sum, na.rm = T, value.var = "value")
respuesta3<-melt(respuesta3, id.vars = c("iso2","year") )
