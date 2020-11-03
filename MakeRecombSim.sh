#!/bin/bash -l
echo -e "if (P$1 == 1){
        if (PR$1 == 1){
        R$1 <- round(sort(runif(1, min=1, max=$3$1max)),digits=0)
        message(\"HapA_$2\\\t0\\\t\",R$1,\"\\\nHapB_$2\\\t\",R$1,\"\\\t\",$3$1max)
        } else {
        R$1 <- round(sort(runif(2, min=1, max=$3$1max)),digits=0)
        message(\"HapA_$2\\\t0\\\t\",R$1[1],\"\\\nHapB_$2\\\t\",R$1[1],\"\\\t\",R$1[2],\"\\\nHapA_$2\\\t\",R$1[2],\"\\\t\",Ref$1max)
}} else {
        if (PR$1 == 1){
        R$1 <- round(sort(runif(1, min=1, max=$3$1max)),digits=0)
        message(\"HapB_$2\\\t0\\\t\",R$1,\"\\\nHapA_$2\\\t\",R$1,\"\\\t\",Ref$1max)
        } else {
        R$1 <- round(sort(runif(2, min=1, max=$3$1max)),digits=0)
        message(\"HapB_$2\\\t0\\\t\",R$1[1],\"\\\nHapA_$2\\\t\",R$1[1],\"\\\t\",R$1[2],\"\\\nHapB_$2\\\t\",R$1[2],\"\\\t\",$3$1max)
}}
"
