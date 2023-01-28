import 'package:newsapi/object/apinewsindo.dart';

List<Map> listNegara = [
  {
    'negara': 'argentina',
    'kode': 'ar',
    'image':
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Flag_of_Argentina_%281816%29.svg/2560px-Flag_of_Argentina_%281816%29.svg.png',
  },
  {
    'negara': 'austria',
    'kode': 'at',
    'image':
        'https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Flag_of_Austria.svg/langid-1024px-Flag_of_Austria.svg.png',
  },
  {
    'negara': 'australia',
    'kode': 'au',
    'image':
        'https://cdn.pixabay.com/photo/2013/07/12/18/42/australia-153732_640.png',
  },
  {
    'negara': 'belgium',
    'kode': 'be',
    'image':
        'https://cdn.pixabay.com/photo/2012/04/11/15/29/belgium-28510__480.png',
  },
  {
    'negara': 'brazil',
    'kode': 'br',
    'image':
        'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Flag_of_Brazil.svg/1280px-Flag_of_Brazil.svg.png',
  },
  {
    'negara': 'bulgaria',
    'kode': 'bg',
    'image':
        'https://cdn.pixabay.com/photo/2016/01/23/22/26/flag-bulgaria-1158177_960_720.png',
  },
  {
    'negara': 'canada',
    'kode': 'ca',
    'image':
        'https://cdn.pixabay.com/photo/2020/02/24/01/45/canada-4875004_960_720.png',
  },
  {
    'negara': 'china',
    'kode': 'cn',
    'image':
        'https://cdn.pixabay.com/photo/2012/04/10/23/05/china-26841_960_720.png',
  },
  {
    'negara': 'colombia',
    'kode': 'co',
    'image':
        'https://cdn.pixabay.com/photo/2015/11/12/16/19/flag-1040561__340.png',
  },
  {
    'negara': 'cuba',
    'kode': 'cu',
    'image':
        'https://cdn.pixabay.com/photo/2013/07/12/15/20/cuba-149689__480.png',
  },
  {
    'negara': 'czech republic',
    'kode': 'cz',
    'image':
        'https://media.istockphoto.com/id/584565944/id/foto/bendera-datar-cekoslowakia.jpg?s=612x612&w=0&k=20&c=GKzb_X6B0VKVuukHybyXDRvPnzV5BCZ_RpZ6RBd9DMY=',
  },
  {
    'negara': 'egypt',
    'kode': 'eg',
    'image':
        'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Flag_of_Egypt.svg/2560px-Flag_of_Egypt.svg.png',
  },
  {
    'negara': 'france',
    'kode': 'fr',
    'image':
        'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Flag_of_France.svg/1280px-Flag_of_France.svg.png',
  },
  {
    'negara': 'germany',
    'kode': 'de',
    'image':
        'https://cdn.pixabay.com/photo/2012/04/12/23/52/germany-31017__340.png',
  },
  {
    'negara': 'greece',
    'kode': 'gr',
    'image':
        'https://cdn.pixabay.com/photo/2015/11/03/09/08/map-1020110_960_720.jpg',
  },
  {
    'negara': 'hong kong',
    'kode': 'hk',
    'image':
        'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Flag_of_Hong_Kong.svg/800px-Flag_of_Hong_Kong.svg.png',
  },
  {
    'negara': 'hungary',
    'kode': 'hu',
    'image':
        'https://media.istockphoto.com/id/482378254/id/vektor/bendera-hongaria.jpg?s=612x612&w=0&k=20&c=8d2qKgiaHGra2JnVNLqQ-ROqDC08cFwKzHAqLWqRKWY=',
  },
  {
    'negara': 'india',
    'kode': 'in',
    'image':
        'https://cdn.pixabay.com/photo/2013/07/13/12/13/flag-159416__340.png',
  },
  {
    'negara': 'indonesia',
    'kode': 'id',
    'image':
        'https://cdn.pixabay.com/photo/2012/04/10/23/01/indonesia-26817__480.png',
  },
  {
    'negara': 'ireland',
    'kode': 'ie',
    'image':
        'https://cdn.pixabay.com/photo/2012/04/10/23/11/ireland-26887_960_720.png',
  },
  {
    'negara': 'israel',
    'kode': 'il',
    'image':
        'https://cdn.pixabay.com/photo/2012/04/10/23/03/israel-26831_960_720.png',
  },
  {
    'negara': 'italy',
    'kode': 'it',
    'image':
        'https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Flag_of_Italy.svg/800px-Flag_of_Italy.svg.png',
  },
  {
    'negara': 'japan',
    'kode': 'jp',
    'image':
        'https://upload.wikimedia.org/wikipedia/commons/9/9e/Flag_of_Japan.svg',
  },
  {
    'negara': 'latvia',
    'kode': 'lv',
    'image':
        'https://cdn.pixabay.com/photo/2013/07/13/14/16/latvia-162338__480.png',
  },
  {
    'negara': 'lithuania',
    'kode': 'lt',
    'image':
        'https://cdn.pixabay.com/photo/2013/07/13/14/16/lithuania-162344_960_720.png',
  },
  {
    'negara': 'malaysia',
    'kode': 'my',
    'image':
        'https://cdn.pixabay.com/photo/2013/07/13/14/16/malaysia-162351_960_720.png',
  },
  {
    'negara': 'mexico',
    'kode': 'mx',
    'image':
        'https://e7.pngegg.com/pngimages/955/254/png-clipart-mexico-city-first-mexican-empire-flag-of-mexico-national-flag-mexica-flag-miscellaneous-flag.png',
  },
  {
    'negara': 'morocco',
    'kode': 'ma',
    'image':
        'https://1.bp.blogspot.com/-cdxYoGxkRNk/VJzQE0k3OtI/AAAAAAAAAII/PbM1kQIdfbo/w1280-h720-p-k-no-nu/Bendera%2BMaroko.jpg',
  },
  {
    'negara': 'netherlands',
    'kode': 'nl',
    'image':
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Flag_of_the_Netherlands.svg/1280px-Flag_of_the_Netherlands.svg.png',
  },
  {
    'negara': 'new zealand',
    'kode': 'nz',
    'image':
        'https://awsimages.detik.net.id/community/media/visual/2015/09/03/e4ca1e42-edae-4e6c-a1e7-e8588e06adf3_169.jpg?w=620&mark=undefined&image_body_visual_id=131059',
  },
  {
    'negara': 'nigeria',
    'kode': 'ng',
    'image':
        'https://cdn.pixabay.com/photo/2013/07/13/14/16/nigeria-162376_960_720.png',
  },
  {
    'negara': 'norway',
    'kode': 'no',
    'image':
        'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Flag_of_Norway.svg/langid-800px-Flag_of_Norway.svg.png',
  },
  {
    'negara': 'philippines',
    'kode': 'ph',
    'image':
        'https://media.istockphoto.com/id/538685785/id/vektor/bendera-filipina.jpg?b=1&s=170667a&w=0&k=20&c=KbWEiFN1OJ3WOKBbCoEBNxRI2FUdxyiPh53pxEdArHs=',
  },
  {
    'negara': 'poland',
    'kode': 'pl',
    'image':
        'https://media.istockphoto.com/id/1141056345/id/vektor/ikon-bendera-polandia-dalam-gaya-datar-ilustrasi-vektor-tanda-nasional-konsep-bisnis-politik.jpg?s=612x612&w=0&k=20&c=_fDxbuBjCoIwj8ZD78JteAdYXhYng_uXIf_Xb-zGXLA=',
  },
  {
    'negara': 'portugal',
    'kode': 'pt',
    'image':
        'https://cdn.pixabay.com/photo/2012/04/10/23/11/portugal-26886_960_720.png',
  },
  {
    'negara': 'romania',
    'kode': 'ro',
    'image':
        'https://www.sitesworld.com/common/x/i/img/big_flags/Romania_Flag.jpg',
  },
  {
    'negara': 'russia',
    'kode': 'ru',
    'image':
        'https://cdn.pixabay.com/photo/2012/04/10/23/12/russia-26896__340.png',
  },
  {
    'negara': 'saudi arabia',
    'kode': 'sa',
    'image':
        'https://cdn.pixabay.com/photo/2013/07/13/14/17/saudi-arabia-162413_960_720.png',
  },
  {
    'negara': 'serbia',
    'kode': 'rs',
    'image':
        'https://media.istockphoto.com/id/657673068/id/vektor/bendera-serbia.jpg?s=612x612&w=0&k=20&c=pUPpJjqE9gobyQGSNqFhNDa1ErETj32pdTeZcPil1cc=',
  },
  {
    'negara': 'singapore',
    'kode': 'sg',
    'image':
        'https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/Flag_of_Singapore.svg/800px-Flag_of_Singapore.svg.png',
  },
  {
    'negara': 'slovakia',
    'kode': 'sk',
    'image':
        'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e6/Flag_of_Slovakia.svg/225px-Flag_of_Slovakia.svg.png',
  },
  {
    'negara': 'slovenia',
    'kode': 'si',
    'image':
        'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f0/Flag_of_Slovenia.svg/2560px-Flag_of_Slovenia.svg.png',
  },
  {
    'negara': 'south africa',
    'kode': 'za',
    'image':
        'https://2.bp.blogspot.com/-S3tBlTmKjCY/Vh8BBaqqmSI/AAAAAAAAHt4/ZPaFeySZncM/s1600/south%2Bafrica%2Bflag.png',
  },
  {
    'negara': 'south korea',
    'kode': 'kr',
    'image':
        'https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Flag_of_South_Korea.svg/225px-Flag_of_South_Korea.svg.png',
  },
  {
    'negara': 'sweden',
    'kode': 'se',
    'image':
        'https://media.istockphoto.com/id/973472848/id/vektor/bendera-swedia.jpg?s=612x612&w=0&k=20&c=GLllzkSa1XGiAJ3qb4_4vFJfgdiH9UzcO906Ket7WNk=',
  },
  {
    'negara': 'switzerland',
    'kode': 'ch',
    'image':
        'https://cdn.pixabay.com/photo/2018/01/26/17/15/swiss-flag-3109178_960_720.png',
  },
  {
    'negara': 'taiwan',
    'kode': 'tw',
    'image':
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/72/Flag_of_the_Republic_of_China.svg/800px-Flag_of_the_Republic_of_China.svg.png',
  },
  {
    'negara': 'thailand',
    'kode': 'th',
    'image':
        'https://cdn.pixabay.com/photo/2012/04/10/23/01/thailand-26813_960_720.png',
  },
  {
    'negara': 'turkey',
    'kode': 'tr',
    'image':
        'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8e/Flag_of_the_Ottoman_Empire_%281844%E2%80%931922%29.svg/225px-Flag_of_the_Ottoman_Empire_%281844%E2%80%931922%29.svg.png',
  },
  {
    'negara': 'uae',
    'kode': 'ae',
    'image':
        'https://upload.wikimedia.org/wikipedia/commons/c/cb/Flag_of_the_United_Arab_Emirates.svg',
  },
  {
    'negara': 'ukraine',
    'kode': 'ua',
    'image':
        'https://cdn.pixabay.com/photo/2012/04/10/16/23/ukraine-26179_960_720.png',
  },
  {
    'negara': 'united kingdom',
    'kode': 'gb',
    'image':
        'https://asset-a.grid.id//crop/0x0:0x0/700x465/photo/2019/03/27/1607473002.jpg',
  },
  {
    'negara': 'united states',
    'kode': 'us',
    'image':
        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Flag_of_the_United_States.svg/300px-Flag_of_the_United_States.svg.png',
  },
  {
    'negara': 'venezuela',
    'kode': 've',
    'image':
        'https://upload.wikimedia.org/wikipedia/commons/thumb/0/06/Flag_of_Venezuela.svg/800px-Flag_of_Venezuela.svg.png',
  },
];

List<Data> listData = [];