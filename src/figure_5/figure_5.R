# LICENSE

# This software is licensed under an MIT License.

# Copyright (c) 2018 Lucas G S França, Pedro Montoya, José Garcia Vivas Miranda.

# Permission is hereby granted, free of charge, to any person obtaining a 
# copy of this software and associated documentation files (the "Software"), 
# to deal in the Software without restriction, including without limitation 
# the rights to use, copy, modify, merge, publish, distribute, sublicense, 
# and/or sell copies of the Software, and to permit persons to whom the 
# Software is furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included 
# in all copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS 
# OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING 
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
# DEALINGS IN THE SOFTWARE.

# Authors: Lucas França(1,2), Pedro Montoya(3), José Garcia Vivas Miranda(1,2)

# 1 Department of Clinical and Experimental Epilepsy, UCL Queen Square Institute 
# of Neurology, University College London, London, United Kingdom

# 2 Department of Physics of the Earth and the Environment, Institute of Physics, 
# Federal University of Bahia, Salvador, Brazil

# 3 Research Institute of Health Sciences (IUNICS), University of the Balearic 
# Islands, Palma de Mallorca, Spain

# email address: lucas.franca.14@ucl.ac.uk, vivasm@gmail.com
# Website: https://lucasfr.github.io/

figure_5 <- function(){

# LOADING FM PATIENTS DATA

fm <- read.csv2("data/R/fm/resumDq.dat",sep="",header = FALSE)

patNames <- str_split_fixed(fm$V1, "_", 2)
fm$V1 <- NULL
fm <- cbind(patNames,fm)
names(fm) <- c("Pat",	"state", "+q", "-q", "Dmin", "EDmin",
               "RDmin", "Dmax", "EDmax", "RDmax", "Do", "EDo",
               "RDo", "D1", "ED1", "RD1", "D2", "ED2", "RD2",
               "qAMin", "qAMax", "Ao", "EAo", "RAo", "Amax",
               "EAmax", "RAmax", "Amin", "EAmin", "RAmin")

# LOADING HEALTHY INDIVIDUALS DATA

hc <- read.csv2("data/R/hc/resumDq.dat",sep="",header = FALSE)

patNames <- str_split_fixed(hc$V1, "_", 2)
hc$V1 <- NULL
hc <- cbind(patNames,hc)
names(hc) <- c("Pat",	"state", "+q", "-q", "Dmin", "EDmin",
               "RDmin", "Dmax", "EDmax", "RDmax", "Do", "EDo",
               "RDo", "D1", "ED1", "RD1", "D2", "ED2", "RD2",
               "qAMin", "qAMax", "Ao", "EAo", "RAo", "Amax",
               "EAmax", "RAmax", "Amin", "EAmin", "RAmin")

# SPLITTING DATAFRAMES

fm_active <- fm[fm$state=="active.txt",]
fm_sleep <- fm[fm$state=="sleep.txt",]
hc_active <- hc[hc$state=="active.txt",]
hc_sleep <- hc[hc$state=="sleep.txt",]


# ESTIMATING PARABOLA RIGHT-SIDE

fm_active$rs <- as.numeric(as.character(fm_active$Amax)) - as.numeric(as.character(fm_active$Ao))
fm_sleep$rs <- as.numeric(as.character(fm_sleep$Amax)) - as.numeric(as.character(fm_sleep$Ao))
hc_active$rs <- as.numeric(as.character(hc_active$Amax)) - as.numeric(as.character(hc_active$Ao))
hc_sleep$rs <- as.numeric(as.character(hc_sleep$Amax)) - as.numeric(as.character(hc_sleep$Ao))


# DIFFERENCES BETWEEN STATES FOR PARABOLA RIGHT-SIDE

diff_fm_rs <- fm_active$rs - fm_sleep$rs
diff_hc_rs <- hc_active$rs - hc_sleep$rs

diff_rs <- data.frame(diff_fm_rs, diff_hc_rs)
names(diff_rs) <- c("Fibromyalgia", "Healthy")

diff_rs <- melt(diff_rs)

leg1 <- paste(expression(p > 0.05))
leg2 <- paste(expression(p < 0.05))

a <- ggplot(data = diff_rs, 
       aes(x = variable, y = value, fill = variable)) + 
  geom_violin(trim=FALSE, 
              alpha = I(0.8)) + 
  scale_fill_manual(values = c("#b2182b","#2166ac"), 
                    labels = c(leg1, 
                               leg2)) + 
  labs(x="Group", 
       y = "Paired difference (Awake - Sleep)") +
  geom_boxplot(width=0.05, 
               fill="white", 
               colour = c("#b2182b","#2166ac")) + 
  geom_jitter(position = position_jitter(0.4), 
              size = I(3), 
              aes(shape = variable)) + 
  scale_shape_manual(values = c(16, 17), 
                     labels = c(leg1, 
                                leg2))+
  theme_bw() + 
  theme(legend.title = element_blank(),
        legend.position = c(0.11, 0.92),
        legend.background = element_rect(colour = "transparent", 
                                         fill = "transparent"),
        axis.title.x=element_blank(), 
        text = element_text(size=18))

return(a)

}
