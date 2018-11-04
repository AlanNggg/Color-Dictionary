import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;


            
            Future<Post> fetchPost() async{
             
              final response = 
              await http.get(Uri.encodeFull('http://terryyess.yabi.me/api/createQRcode.php'),headers: {"Cookie":"_text=THE_CONTENT_OF_YOU_COOKIE_HERE; expires=Thu, 31-Dec-37 23:55:55 GMT; path=/","Accept":"application/json"});
              
              
              if(response.statusCode ==200){
                print(response.body);
                  return Post.fromJson(json.decode(response.body));
              }else{
                  throw Exception('Failed to load post');
              }
            }

            class Post{
              final String base64;
              
              Post({this.base64});

              factory Post.fromJson(Map<String , dynamic>json){
                return Post(
                    base64: json['base64'],

                );
              }
            }

