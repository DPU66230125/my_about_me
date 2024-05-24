import 'package:google_maps_flutter/google_maps_flutter.dart';

class Config {
  static var profileData = <String, dynamic>{
    "picURL": "https://lh3.googleusercontent.com/a/ACg8ocK2XcAPrR3yPKwflsybNNzG3G7hnUBimPo6nBpJR8U4n0wxMOw=s576-c-no",
    "name": "Tummanoon Wanchaem",
    "sub": "Homo Sapien",
    "phone": "0927934612",
    "email": "66230125@dpu.ac.th",
    "bio": "นักศึกษา ป.โท ธรรมดาคนหนึ่งที่กำลังพยายามเรียนให้จบภาพใน 2 ปี แต่เส้นทางแห่งชีวิตไม่ได้ง่ายอย่างที่คิด อุปสรรค์และความอับโชคมากมายกำลังรอเขาอยู่",
    
    "youtubePath": "https://www.youtube.com/watch?v=es7XtrloDIQ",

    "mapLatLng": const LatLng(18.3170581, 99.3986862),

    "blogAPI": "https://tummanoonw-66230125-api.onrender.com/blog", 
    
    //เปิด API service ของตัวเองบน https://render.com/ (มีการเชื่อมต่อกับ GitAction)
    //source code https://github.com/DPU66230125/labnodejs

    "productAPI": "https://testpos.trainingzenter.com/lab_dpu/product",
    
    //สร้างเนื้อหา content ด้วยรหัสนักศึกษาตัวเอง ใน https://testpos.trainingzenter.com/lab_dpu/product/create/

    "productStudentNo": "66230125",
    
    //เลขรหัสนักศึกษาเพื่อให้ API ค้นหา content ของเราเอง

  };
}
