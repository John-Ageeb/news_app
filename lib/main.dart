/// apis: used to link back end with front end
/// use to link two apps
///https is one of api
/// any apis contain the follwoing:
/// https://www.google.com/search?q=https+request+types&sca_esv=4bb5769046dd599f&sca_upv=1&sxsrf=ADLYWILtQ3fSj1zfb38QW4_4l-gIAsAzCA%3A1723973528086&ei=mL_BZqb5BIPzi-gP6oadgAQ&oq=https+request+ty&gs_lp=Egxnd3Mtd2l6LXNlcnAiEGh0dHBzIHJlcXVlc3QgdHkqAggAMggQABiABBjLATIIEAAYgAQYywEyBhAAGBYYHjIGEAAYFhgeMgYQABgWGB4yBhAAGBYYHjIIEAAYgAQYogQyCBAAGIAEGKIEMggQABiABBiiBDIIEAAYgAQYogRIrR5QNVjVFHACeAGQAQCYAYsBoAGGBKoBAzAuNLgBA8gBAPgBAZgCBqACngTCAgoQABiwAxjWBBhHwgINEAAYgAQYsAMYQxiKBZgDAIgGAZAGCpIHAzIuNKAHtww&sclient=gws-wiz-serp
///1- base URL :https://www.google.com (Server that contains api)
///2-End Point Name: after "/" "search" this is the fuction name ehcih i need to call
///3- after "?: data which need to send to this function
///q=https+request+types
///
///
///
/// to make http request, we must know the following:
/// 1- request typr (get - post - delete- ...etc)
/// 2- Get request url( Base Url + Api Name (function name)+ "?" + arguments)
/// 3- Post request url( Base Url + Api Name + "?" + arguments)
/// arguments in post request mostly added in post body not url for security resones
/// for get requests: no body
/// -----------------------------
///
/// Response (returning data after call request):
///- Body --> html || Json || xml
///- Header
///- Status Code (int): such as 404 error - mean the status os response if it return succefully or with error
/// 40x client errors
/// 500 Server errors
/// 200 Successful response
///
///
/// We can use Postman to check if api working or not
///we will use the follwoing web site to get a free api
///https://newsapi.org/
///

import 'package:flutter/material.dart';
import 'package:news_app/ui/screens/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Home.routeName: (_) => Home(),
      },
      initialRoute: Home.routeName,
    );
  }
}
