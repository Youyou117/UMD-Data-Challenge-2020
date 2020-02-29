traffic = read.csv('newtraffic2.csv')
summary(traffic$location)
traffic$day = substring(traffic$time,9,10)
traffic$weekdays = ifelse((traffic$day=='2')|(traffic$day=='3')|(traffic$day=='9')|(traffic$day=='10'),0,1)
traffic$weather = weather$weather..1.if.under.40.f.
traffic$school = substring(traffic$time,12,13)
traffic$rushhour = ifelse((traffic$school=='09')|(traffic$school=='10')|
                            (traffic$school=='17')|(traffic$school=='18'),1,0)
##plot one sensor for one day
onedayset = subset(traffic,traffic$location=='University_Blvd_&_Paint_Branch_Dr'&traffic$day=='28')
View(onedayset)
cars_sum <- aggregate(onedayset$cars, list(onedayset$school), sum)
View(cars_sum)
plot(cars_sum$Group.1 ,cars_sum$x)


#decide events
traffic$events = ifelse((traffic$time=='2019-11-01T18:30:00-04:00')|
                         (traffic$time== '2019-11-01T18:45:00-04:00')|
                        (traffic$time=='2019-11-01T19:00:00-04:00')|
                         (traffic$time== '2019-11-01T19:15:00-04:00')|
                           (traffic$time=='2019-11-01T19:30:00-04:00')|
                        (traffic$time=='2019-11-01T19:45:00-04:00')|
                         (traffic$time== '2019-11-01T20:00:00-04:00')|
                           (traffic$time== '2019-11-01T21:30:00-04:00')|
                        (traffic$time=='2019-11-01T21:45:00-04:00')|
                         (traffic$time== '2019-11-01T22:00:00-04:00')|
                           (traffic$time== '2019-11-01T22:15:00-04:00')|
                        (traffic$time=='2019-11-01T22:30:00-04:00')|
                         (traffic$time== '2019-11-01T22:45:00-04:00')|
                           (traffic$time== '2019-11-01T23:00:00-04:00')|
                        (traffic$time=='2019-11-02T11:00:00-04:00')|
                         (traffic$time=='2019-11-02T11:15:00-04:00')|
                           (traffic$time=='2019-11-02T11:30:00-04:00')|
                          (traffic$time=='2019-11-02T11:45:00-04:00')|
                               (traffic$time=='2019-11-02T12:00:00-04:00')|
                                 (traffic$time== '2019-11-02T12:15:00-04:00')|
                                   (traffic$time== '2019-11-02T12:30:00-04:00')|
                                     (traffic$time=='2019-11-02T15:00:00-04:00')|
                        (traffic$time=='2019-11-02T15:15:00-04:00')|
                        (traffic$time=='2019-11-02T15:30:00-04:00')|
                         (traffic$time=='2019-11-02T15:45:00-04:00')|
                        (traffic$time=='2019-11-02T16:00:00-04:00')|
                         (traffic$time=='2019-11-02T16:15:00-04:00')|
                        (traffic$time== '2019-11-02T16:30:00-04:00')|
                        (traffic$time== '2019-11-03T14:00:00-04:00')|
                        (traffic$time== '2019-11-03T14:15:00-04:00')|
                        (traffic$time== '2019-11-03T14:30:00-04:00')|
                        (traffic$time== '2019-11-03T14:45:00-04:00')|
                        (traffic$time== '2019-11-03T15:00:00-04:00')|
                        (traffic$time== '2019-11-03T15:15:00-04:00')|
                        (traffic$time== '2019-11-03T15:30:00-04:00')|
                        (traffic$time== '2019-11-03T16:30:00-04:00')|
                        (traffic$time=='2019-11-03T16:45:00-04:00')|
                       (traffic$time== '2019-11-03T17:00:00-04:00')|
                        (traffic$time=='2019-11-03T17:15:00-04:00')|
                         (traffic$time=='2019-11-03T17:30:00-04:00')|
                        (traffic$time== '2019-11-03T17:45:00-04:00')|
                       (traffic$time== '2019-11-03T18:00:00-04:00')|
                        (traffic$time== '2019-11-05T10:00:00-04:00')|
                        (traffic$time=='2019-11-05T10:15:00-04:00')|
                       (traffic$time=='2019-11-05T10:30:00-04:00')|
                         (traffic$time== '2019-11-05T10:45:00-04:00')|
                        (traffic$time== '2019-11-05T11:00:00-04:00')|
                       (traffic$time== '2019-11-05T11:15:00-04:00')|
                        (traffic$time== '2019-11-05T11:30:00-04:00')|
                        (traffic$time=='2019-11-05T13:00:00-04:00')|
                        (traffic$time=='2019-11-05T13:15:00-04:00')|
                        (traffic$time=='2019-11-05T13:30:00-04:00')|
                        (traffic$time=='2019-11-05T13:45:00-04:00')|
                        (traffic$time=='2019-11-05T14:00:00-04:00')|
                        (traffic$time== '2019-11-05T14:15:00-04:00')|
                         (traffic$time=='2019-11-05T14:30:00-04:00')|
                       (traffic$time== '2019-11-05T18:30:00-04:00')|
                       (traffic$time== '2019-11-05T18:45:00-04:00')|
                         (traffic$time==  '2019-11-05T19:00:00-04:00')|
                           (traffic$time== '2019-11-05T19:15:00-04:00')|
                             (traffic$time== '2019-11-05T19:30:00-04:00')|
                               (traffic$time==  '2019-11-05T19:45:00-04:00')|
                                 (traffic$time==  '2019-11-05T20:00:00-04:00')|
                                   (traffic$time== '2019-11-05T21:30:00-04:00')|
                                     (traffic$time== '2019-11-05T21:45:00-04:00')|
                                       (traffic$time==  '2019-11-05T22:00:00-04:00')|
                                         (traffic$time==  '2019-11-05T22:15:00-04:00')|
                                           (traffic$time==  '2019-11-05T22:30:00-04:00')|
                                             (traffic$time==  '2019-11-05T22:45:00-04:00')|
                                               (traffic$time==  '2019-11-05T23:00:00-04:00')|
                                               (traffic$time==  '2019-11-09T20:00:00-04:00')|
                                                 (traffic$time=='2019-11-09T20:15:00-04:00')|
                        (traffic$time==  '2019-11-09T20:30:00-04:00')|
                          (traffic$time=='2019-11-09T20:45:00-04:00')|
                            (traffic$time==  '2019-11-09T21:00:00-04:00')|
                              (traffic$time== '2019-11-09T21:15:00-04:00')|
                        (traffic$time=='2019-11-09T21:30:00-04:00')|
                         (traffic$time=='2019-11-09T23:00:00-04:00')|
                            (traffic$time== '2019-11-09T23:15:00-04:00')|
                        (traffic$time== '2019-11-09T23:30:00-04:00')|
                          (traffic$time== '2019-11-09T23:45:00-04:00')|
                            (traffic$time== '2019-11-10T00:00:00-04:00')|
                              (traffic$time== '2019-11-10T00:15:00-04:00')|
                        (traffic$time== '2019-11-10T00:30:00-04:00')|
                          (traffic$time== '2019-11-10T14:00:00-04:00')|
                            (traffic$time== '2019-11-10T14:15:00-04:00')|
                              (traffic$time== '2019-11-10T14:30:00-04:00')|
                                (traffic$time== '2019-11-10T14:45:00-04:00')|
                                  (traffic$time== '2019-11-10T15:00:00-04:00')|
                                    (traffic$time== '2019-11-10T15:15:00-04:00')|
                                      (traffic$time== '2019-11-10T15:30:00-04:00')|
                                        (traffic$time=='2019-11-10T17:00:00-04:00')|
                                          (traffic$time=='2019-11-10T17:15:00-04:00')|
                                            (traffic$time=='2019-11-10T17:30:00-04:00')|
                                              (traffic$time=='2019-11-10T17:45:00-04:00')|
                                                (traffic$time=='2019-11-10T18:00:00-04:00')|
                                                  (traffic$time=='2019-11-10T18:15:00-04:00')|
                                                    (traffic$time=='2019-11-10T18:30:00-04:00'),1,0)

traffic$total_volume = traffic$pedestrians+traffic$bicyclists+traffic$cars+
  traffic$buses+traffic$trucks

#whether the traffic is heavy or not 
avgtraffic = mean(traffic$total_volume)
traffic$traffic_ornot = ifelse(traffic$total_volume>avgtraffic,1,0)
 
traffic$total_volume=NULL
traffic$school=NULL
traffic$day=NULL

## 
attach(traffic)
#train and test
train_insts = sample(nrow(traffic), .7*nrow(traffic))
traffic_train = traffic[train_insts,]
traffic_test = traffic[-train_insts,]

##logictic regression
logistic_traffic = glm(traffic_ornot~weather + events+ 
                                weekdays + rushhour,data = traffic_train,family="binomial")

cutoff = 0.5
traffic_preds_log = predict(logistic_traffic,newdata = traffic_test,type = 'response')

traffic_class_log = ifelse(traffic_preds_log>cutoff,1,0) 

#caculate the accuracy
traffic_confusionmatrix_log = table(traffic_test$traffic_ornot,traffic_class_log)
traffic_confusionmatrix_log
# The rate of errors
accuracy_traffic_log =traffic_confusionmatrix_log[1,1]/(traffic_confusionmatrix_log[1,1]+traffic_confusionmatrix_log[2,1]) 
accuracy_traffic_log

TP = traffic_confusionmatrix_log[2,2]
FP = traffic_confusionmatrix_log[1,2]
TN = traffic_confusionmatrix_log[1,1]
FN = traffic_confusionmatrix_log[2,1]
accuracy_traffic_log = (TP+TN)/(TP+FP+TN+FN)
accuracy_traffic_log




###1.southgate_north 
southgate_north = subset(traffic,traffic$location=='South_Gate_Northern_View')
#train and test
train_insts_southgatenorth = sample(nrow(southgate_north), .7*nrow(southgate_north))
southgatenorth_train = traffic[train_insts_southgatenorth,]
southgatenorth_test = traffic[-train_insts_southgatenorth,]

attach(southgatenorth_train)
detach(southgatenorth_train)
##logictic regression
logistic_southgatenorth = glm(traffic_ornot~weather + events+ 
                                weekdays + rushhour,data = southgatenorth_train,family="binomial")

cutoff = 0.5
traffic_southgatenorth_preds_log = predict(logistic_southgatenorth,newdata = southgatenorth_test,type = 'response')

traffic_southgatenorth_class_log = ifelse(traffic_southgatenorth_preds_log>cutoff,1,0) 
traffic_southgatenorth_class_log
#caculate the accuracy
southgatenorth_confusionmatrix_log = table(southgatenorth_test$traffic_ornot,traffic_southgatenorth_class_log)
southgatenorth_confusionmatrix_log
# The rate of errors
accuracy_southgatenorth_log =southgatenorth_confusionmatrix_log[1,1]/(southgatenorthd_confusionmatrix_log[1,1]+southgatenorth_confusionmatrix_log[2,1]) 
accuracy_southgatenorth_log

TP = southgatenorth_confusionmatrix_log[2,2]
FP = southgatenorth_confusionmatrix_log[1,2]
TN = southgatenorth_confusionmatrix_log[1,1]
FN = southgatenorth_confusionmatrix_log[2,1]
accuracy_southgatenorth_log = (TP+TN)/(TP+FP+TN+FN)
accuracy_southgatenorth_log

###2.campus_presid 
campus_presid = subset(traffic,traffic$location=='Campus_Dr_&_Presidential_Ave')
#train and test
train_insts_campus_presid = sample(nrow(campus_presid), .7*nrow(campus_presid))
campus_presid_train = traffic[train_insts_campus_presid,]
campus_presid_test = traffic[-train_insts_campus_presid,]
detach(southgatenorth_train)
attach(campus_presid_train)
##logictic regression
logistic_campus_presid = glm(traffic_ornot~weather + events+ 
                                weekdays + rushhour,data = campus_presid_train,family="binomial")

cutoff = 0.5
traffic_campus_presid_preds_log = predict(logistic_campus_presid,newdata = campus_presid_test,type = 'response')
traffic_campus_presid_class_log = ifelse(traffic_campus_presid_preds_log>cutoff,1,0) 
View(traffic_campus_presid_class_log)
View(campus_presid_test$traffic_ornot)

#caculate the accuracy
campus_presid_confusionmatrix_log = table(campus_presid_test$traffic_ornot,traffic_campus_presid_class_log)
campus_presid_confusionmatrix_log
# The rate of errors
accuracy_campus_presid_log =campus_presid_confusionmatrix_log[1,1]/(campus_presid_confusionmatrix_log[1,1]+campus_presid_confusionmatrix_log[2,1]) 
accuracy_campus_presid_log

TP = campus_presid_confusionmatrix_log[2,2]
FP = campus_presid_confusionmatrix_log[1,2]
TN = campus_presid_confusionmatrix_log[1,1]
FN = campus_presid_confusionmatrix_log[2,1]
accuracy_campus_presid_log = (TP+TN)/(TP+FP+TN+FN)
accuracy_campus_presid_log


###3.uni_blvd 
uni_blvd = subset(traffic,traffic$location=='University_Blvd_&_Paint_Branch_Dr')
#train and test
train_insts_uni_blvd = sample(nrow(uni_blvd), .7*nrow(uni_blvd))
uni_blvd_train = traffic[train_insts_uni_blvd,]
uni_blvd_test = traffic[-train_insts_uni_blvd,]

detach(campus_presid_train)
attach(uni_blvd_train)
##logictic regression
logistic_uni_blvd = glm(traffic_ornot~weather + events+ 
                          weekdays + rushhour,data = campus_presid_train,family="binomial")
cutoff = 0.5
traffic_uni_blvd_preds_log = predict(logistic_uni_blvd,newdata = uni_blvd_test,type = 'response')
traffic_uni_blvd_class_log = ifelse(traffic_uni_blvd_preds_log>cutoff,1,0) 

#caculate the accuracy
uni_blvd_confusionmatrix_log = table(uni_blvd_test$traffic_ornot,traffic_uni_blvd_class_log)
uni_blvd_confusionmatrix_log
# The rate of errors
accuracy_uni_blvd_log = uni_blvd_confusionmatrix_log[1,1]/(uni_blvd_confusionmatrix_log[1,1]+uni_blvd_confusionmatrix_log[2,1]) 
accuracy_uni_blvd_log

TP2 = uni_blvd_confusionmatrix_log[2,2]
FP2 = uni_blvd_confusionmatrix_log[1,2]
TN2 = uni_blvd_confusionmatrix_log[1,1]
FN2 = uni_blvd_confusionmatrix_log[2,1]

accuracy_uni_blvd_log = (TP2+TN2)/(TP2+FP2+TN2+FN2)
accuracy_uni_blvd_log

###4.campus_paint_Dr1 

campus_paint_Dr1 = subset(traffic,traffic$location=='Campus_Dr_At_Paint_Branch_Dr')
#train and test
train_insts_campus_paint_Dr1 = sample(nrow(campus_paint_Dr1), .7*nrow(campus_paint_Dr1))
campus_paint_Dr1_train = traffic[train_insts_campus_paint_Dr1,]
campus_paint_Dr1_test = traffic[-train_insts_campus_paint_Dr1,]
detach(uni_blvd_trai)
attach(campus_paint_Dr1)
##logictic regression
logistic_campus_paint_Dr1 = glm(traffic_ornot~weather + events+ weekdays + rushhour,data = campus_presid_train,family="binomial")

cutoff = 0.5
traffic_campus_paint_Dr1_preds_log = predict(logistic_campus_paint_Dr1,newdata = campus_paint_Dr1_test,type = 'response')
traffic_campus_paint_Dr1_class_log = ifelse(traffic_campus_paint_Dr1_preds_log>cutoff,1,0) 

#caculate the accuracy
campus_paint_Dr1_confusionmatrix_log = table(campus_paint_Dr1_test$traffic_ornot,traffic_campus_paint_Dr1_class_log)
campus_paint_Dr1_confusionmatrix_log 
# The rate of errors
accuracy_campus_paint_Dr1_log = campus_paint_Dr1_confusionmatrix_log[1,1]/(campus_paint_Dr1_confusionmatrix_log[1,1]+campus_paint_Dr1_confusionmatrix_log[2,1]) 
accuracy_campus_paint_Dr1_log


TP2 = campus_paint_Dr1_confusionmatrix_log[2,2]
FP2 = campus_paint_Dr1_confusionmatrix_log[1,2]
TN2 = campus_paint_Dr1_confusionmatrix_log[1,1]
FN2 = campus_paint_Dr1_confusionmatrix_log[2,1]

accuracy_campus_paint_Dr1_log = (TP2+TN2)/(TP2+FP2+TN2+FN2)


###5.regentDr2

regentDr2 = subset(traffic,traffic$location=='Regents_Dr_&_Stadium_Dr_2')
#train and test
train_insts_regentDr2 = sample(nrow(regentDr2), .7*nrow(regentDr2))
regentDr2_train = traffic[train_insts_regentDr2,]
regentDr2_test = traffic[-train_insts_regentDr2,]
detach(campus_paint_Dr1)
attach(regentDr2)
##logictic regression
logistic_regentDr2 = glm(traffic_ornot~weather + events+ weekdays + rushhour,data = campus_presid_train,family="binomial")

cutoff = 0.5
traffic_regentDr2_preds_log = predict(logistic_regentDr2,newdata = regentDr2_test,type = 'response')
traffic_regentDr2_class_log = ifelse(traffic_regentDr2_preds_log>cutoff,1,0) 

#caculate the accuracy
regentDr2_confusionmatrix_log = table(regentDr2_test$traffic_ornot,traffic_regentDr2_class_log)
regentDr2_confusionmatrix_log
# The rate of errors

accuracy_regentDr2_log = regentDr2_confusionmatrix_log[1,1]/(campus_paint_Dr1_confusionmatrix_log[1,1]+campus_paint_Dr1_confusionmatrix_log[2,1]) 
accuracy_regentDr2_log

TP2 = regentDr2_confusionmatrix_log[2,2]
FP2 = regentDr2_confusionmatrix_log[1,2]
TN2 = regentDr2_confusionmatrix_log[1,1]
FN2 = regentDr2_confusionmatrix_log[2,1]

accuracy_regentDr2_log = (TP2+TN2)/(TP2+FP2+TN2+FN2)



