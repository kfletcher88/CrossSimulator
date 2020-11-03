#!/usr/bin/R
Ref1max <- 30406945
Ref2max <- 19687553
Ref3max <- 23446172
Ref4max <- 18570552
Ref5max <- 26953895
Alt1max <- 30408344
Alt2max <- 19689737
Alt3max <- 23443882
Alt4max <- 18570964
Alt5max <- 26957460
PR1 <- round(runif(1,min=1,max=2),digits=0)
PR2 <- round(runif(1,min=1,max=2),digits=0)
PR3 <- round(runif(1,min=1,max=2),digits=0)
PR4 <- round(runif(1,min=1,max=2),digits=0)
PR5 <- round(runif(1,min=1,max=2),digits=0)
P1 <- round(runif(1,min=1,max=2),digits=0)
P2 <- round(runif(1,min=1,max=2),digits=0)
P3 <- round(runif(1,min=1,max=2),digits=0)
P4 <- round(runif(1,min=1,max=2),digits=0)
P5 <- round(runif(1,min=1,max=2),digits=0)
if (P1 == 1){
        if (PR1 == 1){
        R1 <- round(sort(runif(1, min=1, max=Ref1max)),digits=0)
        message("HapA_NC_003070.9\t0\t",R1,"\nHapB_NC_003070.9\t",R1,"\t",Ref1max)
        } else {
        R1 <- round(sort(runif(2, min=1, max=Ref1max)),digits=0)
        message("HapA_NC_003070.9\t0\t",R1[1],"\nHapB_NC_003070.9\t",R1[1],"\t",R1[2],"\nHapA_NC_003070.9\t",R1[2],"\t",Ref1max)
}} else {
        if (PR1 == 1){
        R1 <- round(sort(runif(1, min=1, max=Ref1max)),digits=0)
        message("HapB_NC_003070.9\t0\t",R1,"\nHapA_NC_003070.9\t",R1,"\t",Ref1max)
        } else {
        R1 <- round(sort(runif(2, min=1, max=Ref1max)),digits=0)
        message("HapB_NC_003070.9\t0\t",R1[1],"\nHapA_NC_003070.9\t",R1[1],"\t",R1[2],"\nHapB_NC_003070.9\t",R1[2],"\t",Ref1max)
}}

if (P2 == 1){
        if (PR2 == 1){
        R2 <- round(sort(runif(1, min=1, max=Ref2max)),digits=0)
        message("HapA_NC_003071.7\t0\t",R2,"\nHapB_NC_003071.7\t",R2,"\t",Ref2max)
        } else {
        R2 <- round(sort(runif(2, min=1, max=Ref2max)),digits=0)
        message("HapA_NC_003071.7\t0\t",R2[1],"\nHapB_NC_003071.7\t",R2[1],"\t",R2[2],"\nHapA_NC_003071.7\t",R2[2],"\t",Ref2max)
}} else {
        if (PR2 == 1){
        R2 <- round(sort(runif(1, min=1, max=Ref2max)),digits=0)
        message("HapB_NC_003071.7\t0\t",R2,"\nHapA_NC_003071.7\t",R2,"\t",Ref2max)
        } else {
        R2 <- round(sort(runif(2, min=1, max=Ref2max)),digits=0)
        message("HapB_NC_003071.7\t0\t",R2[1],"\nHapA_NC_003071.7\t",R2[1],"\t",R2[2],"\nHapB_NC_003071.7\t",R2[2],"\t",Ref2max)
}}

if (P3 == 1){
        if (PR3 == 1){
        R3 <- round(sort(runif(1, min=1, max=Alt3max)),digits=0)
        message("HapA_NC_003074.8\t0\t",R3,"\nHapB_NC_003074.8\t",R3,"\t",Alt3max)
        } else {
        R3 <- round(sort(runif(2, min=1, max=Alt3max)),digits=0)
        message("HapA_NC_003074.8\t0\t",R3[1],"\nHapB_NC_003074.8\t",R3[1],"\t",R3[2],"\nHapA_NC_003074.8\t",R3[2],"\t",Ref3max)
}} else {
        if (PR3 == 1){
        R3 <- round(sort(runif(1, min=1, max=Alt3max)),digits=0)
        message("HapB_NC_003074.8\t0\t",R3,"\nHapA_NC_003074.8\t",R3,"\t",Ref3max)
        } else {
        R3 <- round(sort(runif(2, min=1, max=Alt3max)),digits=0)
        message("HapB_NC_003074.8\t0\t",R3[1],"\nHapA_NC_003074.8\t",R3[1],"\t",R3[2],"\nHapB_NC_003074.8\t",R3[2],"\t",Alt3max)
}}

if (P4 == 1){
        if (PR4 == 1){
        R4 <- round(sort(runif(1, min=1, max=Ref4max)),digits=0)
        message("HapA_NC_003075.7\t0\t",R4,"\nHapB_NC_003075.7\t",R4,"\t",Ref4max)
        } else {
        R4 <- round(sort(runif(2, min=1, max=Ref4max)),digits=0)
        message("HapA_NC_003075.7\t0\t",R4[1],"\nHapB_NC_003075.7\t",R4[1],"\t",R4[2],"\nHapA_NC_003075.7\t",R4[2],"\t",Ref4max)
}} else {
        if (PR4 == 1){
        R4 <- round(sort(runif(1, min=1, max=Ref4max)),digits=0)
        message("HapB_NC_003075.7\t0\t",R4,"\nHapA_NC_003075.7\t",R4,"\t",Ref4max)
        } else {
        R4 <- round(sort(runif(2, min=1, max=Ref4max)),digits=0)
        message("HapB_NC_003075.7\t0\t",R4[1],"\nHapA_NC_003075.7\t",R4[1],"\t",R4[2],"\nHapB_NC_003075.7\t",R4[2],"\t",Ref4max)
}}

if (P5 == 1){
        if (PR5 == 1){
        R5 <- round(sort(runif(1, min=1, max=Ref5max)),digits=0)
        message("HapA_NC_003076.8\t0\t",R5,"\nHapB_NC_003076.8\t",R5,"\t",Ref5max)
        } else {
        R5 <- round(sort(runif(2, min=1, max=Ref5max)),digits=0)
        message("HapA_NC_003076.8\t0\t",R5[1],"\nHapB_NC_003076.8\t",R5[1],"\t",R5[2],"\nHapA_NC_003076.8\t",R5[2],"\t",Ref5max)
}} else {
        if (PR5 == 1){
        R5 <- round(sort(runif(1, min=1, max=Ref5max)),digits=0)
        message("HapB_NC_003076.8\t0\t",R5,"\nHapA_NC_003076.8\t",R5,"\t",Ref5max)
        } else {
        R5 <- round(sort(runif(2, min=1, max=Ref5max)),digits=0)
        message("HapB_NC_003076.8\t0\t",R5[1],"\nHapA_NC_003076.8\t",R5[1],"\t",R5[2],"\nHapB_NC_003076.8\t",R5[2],"\t",Ref5max)
}}

