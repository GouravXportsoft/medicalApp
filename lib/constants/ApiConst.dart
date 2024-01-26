import 'package:flutter/material.dart';

const String baseURL = 'http://ec2-54-159-209-201.compute-1.amazonaws.com:8080';
const String validationEndpoint = '/user-api/validate';
const String updatePaymentMethod = '/user-api/updatepaymentmethod';
const String updatelogingDetails = '/user-api/updatelogindetails';
const String showDeals = '/user-api/showdeals';

const String userActivity = '/user-api/logUserActivity';
const String add = '/user-api/add';
/////////////////////////////////post/////////////////////////////
const String getUser = '/user-controller/getUser';
const String unsubscribe = '/user-api/unsubscribe/{userName}';
const String subscribe = '/user-api/subscribe/{userName}';
