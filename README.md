# flutter_app

A new Flutter application.

## Screen Width calculation

    final double deviceWidth = MediaQuery
          .of(context)
          .size
          .width;
### To reduce the screen size when horizontal orientation  
    final double targetWidth = deviceWidth > 550 ? 500.0 : deviceWidth * 0.9;


