import 'package:equatable/equatable.dart';
import 'package:uas_komnas_blog/commons/helper/helper.dart';

class BlogModels extends Equatable {
  int? id;
  String? title;
  String? category;
  String? description;
  String? date;
  Map<String, String>? asset;

  BlogModels({
    this.id,
    this.title,
    this.category,
    this.date,
    this.description,
    this.asset,
  });

  @override
  List<Object?> get props => [id, title, category, date, description, asset];
}

List<BlogModels> blogPosts = [
  BlogModels(
    id: 1,
    date: DateHelper.humans(DateHelper.toDateTime('25 09 2021')),
    asset: const {
      'url': 'https://youtu.be/wk146eGRUtI',
      'pdf': 'assets/pdf/tugas1.pdf',
      'type': 'video',
    },
    title: "Tugas 1 - Review Video A Day Made of Glass 1",
    category: 'individu',
    description: '''
        Menurut saya tentang Video A Day Made of Glass itu adalah gambaran dari kehidupan manusia dimasa depan yang semuanya serba digital. Dari teknologi-teknologi yang ditampilkan tersebut rata semuanya terbuat dari kaca atau glass, yang terkesan seperti simpel, minimalis, dan mewah sesuai judul video tersebut yaitu A Day Made of Glass.
        ''',
  ),
  BlogModels(
    id: 2,
    date: DateHelper.humans(DateHelper.toDateTime('2 10 2021')),
    asset: const {
      'url':
          'https://images.unsplash.com/photo-1560331027-f4a9868c0fc7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
      'pdf': 'assets/pdf/tugas2.pdf',
      'type': 'image',
    },
    title: "Tugas 2 - Perkembangan Masyarakat Informasi",
    category: 'individu',
    description: '''
        ...
        ''',
  ),
  BlogModels(
    id: 3,
    date: DateHelper.humans(DateHelper.toDateTime('9 10 2021')),
    asset: const {
      'url':
          'https://images.unsplash.com/photo-1594771804886-a933bb2d609b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1482&q=80',
      'pdf': 'assets/pdf/tugas3.pdf',
      'type': 'image',
    },
    title: "Tugas 3 - Pemanfaatan Komputer dalam Pertanian",
    category: 'individu',
    description: '''
        Pemanfaatan Teknologi Informasi dan Komunikasi (TIK) telah meliputi berbagai bidang kehidupan masyarakat, termasuk bidang pertanian. Penetrasi TIK di bidang pertanian ini sering disebut dengan istilah electronic Agriculture yang disingkat e-Agriculture. Pada dasarnya e-Agriculture adalah pemanfaatan Teknologi Informasi dan Komunikasi dalam bidang pertanian. Pemanfaatan ini dapat dilakukan di semua aktivitas pertanian, mulai dari proses produksi sampai pada pemasaran hasilnya. Pemanfaatan TIK dapat meliputi berbagai aspek, baik itu perangkat telekomunikasi, komputer ataupun perangkat lunaknya. Tentunya dengan e-Agriculture ini diharapkan TIK dapat dijadikan sebagai alat untuk membantu mengatasi berbagai kendala yang ada.
        ''',
  ),
  BlogModels(
    id: 4,
    date: DateHelper.humans(DateHelper.toDateTime('16 10 2021')),
    asset: const {
      'url':
          'https://images.unsplash.com/photo-1534330207526-8e81f10ec6fc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
      'pdf': 'assets/pdf/tugas4.pdf',
      'type': 'image',
    },
    title: "Tugas 4 - Dampak Positif dan Negatif",
    category: 'individu',
    description: '''
        Pengertian Teknologi Informasi (TI) secara umum adalah suatu usaha untuk membantu manusia dalam membuat, mengubah, menyimpan, mengomunikasikan dan/atau menyebarkan informasi dengan menggunakan teknologi, khususnya aplikasi perangkat keras dan perangkat lunak komputer. Sedangkan paradoks adalah pernyataan yang bertentangan (berlawanan) dengan pendapat umum atau kebenaran, tetapi kenyataannya mengandung kebenaran.
        ''',
  ),
  BlogModels(
    id: 5,
    date: DateHelper.humans(DateHelper.toDateTime('23 10 2021')),
    asset: const {
      'url':
          'https://images.unsplash.com/photo-1517245386807-bb43f82c33c4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
      'pdf': 'assets/pdf/tugas5.pdf',
      'type': 'image',
    },
    title: "Tugas 5 - Profesi SEO Marketing dan iOS/Android Developer",
    category: 'individu',
    description: '''
        Pertama-tama, kita harus mengulas terlebih dahulu deskripsi pekerjaan masing-masing profesi yang bernaung di bidang perkembangan teknologi ini. Android developer adalah profesi di mana seorang pengembang software memiliki spesialisasi untuk memajukan kinerja aplikasi pada perangkat yang menggunakan sistem operasi Android. Sedangkan iOS developer mengerahkan fokusnya untuk teknis pengembangan aplikasi pada perangkat seluler berbasis sistem iOS.
        ''',
  ),
  BlogModels(
    id: 6,
    date: DateHelper.humans(DateHelper.toDateTime('31 10 2021')),
    asset: const {
      'url': 'https://youtu.be/6itsW0ZFFsE',
      'pdf': 'assets/pdf/tugas6(kelompok).pdf',
      'type': 'video',
    },
    title: "Tugas 6 - Review Review Aplikasi Google Classroom",
    category: 'kelompok',
    description: '''
        Google Classroom, diperkenalkan pada Januari 2015,. Pendidik bisa membuat kelas mereka sendiri dan membagikan kode kelas tersebut atau mengundang para siswanya. Google Classroom ini diperuntukkan untuk membantu semua ruang lingkup pendidikan yang membantu siswa untuk menemukan atau mengatasi kesulitan pembelajaran, membagikan pelajaran dan membuat tugas tanpa harus hadir ke kelas.
        ''',
  ),
  BlogModels(
    id: 7,
    date: DateHelper.humans(DateHelper.toDateTime('6 11 2021')),
    asset: const {
      'url':
          'https://images.unsplash.com/photo-1541728472741-03e45a58cf88?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1632&q=80',
      'pdf': 'assets/pdf/tugas7.pdf',
      'type': 'image',
    },
    title:
        "Tugas 7 - Virus yang Menyerang PC dan Cara Kerja dan penyebarannnya",
    category: 'individu',
    description: '''
        Untuk mencegah serangan virus, pasang laptop atau komputer Anda dengan antivirus. Scan komputer dan laptop secara teratur. Dan tips yang harus Anda ingat adalah tidak membuka atau menekan link sembarangan jika sumbernya tak jelas.
        ''',
  ),
  BlogModels(
    id: 8,
    date: DateHelper.humans(DateHelper.toDateTime('4 12 2021')),
    asset: const {
      'url':
          'https://images.unsplash.com/photo-1599583863916-e06c29087f51?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2184&q=80',
      'pdf': 'assets/pdf/tugas8.pdf',
      'type': 'image',
    },
    title: "Tugas 8 - Inovasi Dalam Bidang Teknologi",
    category: 'individu',
    description: '''
        Kalau kalian tau di daerah Toronto di Kanada sudah membuat sebuah trobosan teknologi terbaru. Toronto merupakan salah satu kota yang bertujuan menjadi tempat pertama yang berhasil mengintegrasikan desain perkotaan modern dengan teknologi digital yang paling modern.
        ''',
  ),
  BlogModels(
    id: 9,
    date: DateHelper.humans(DateHelper.toDateTime('20 12 2021')),
    asset: const {
      'url':
          'https://images.unsplash.com/photo-1562813733-b31f71025d54?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1469&q=80',
      'pdf': 'assets/pdf/tugas9(kelompok).pdf',
      'type': 'image',
    },
    title: "Tugas 9 - Cybercrime dalam bidang Pendidikan",
    category: 'kelompok',
    description: '''
        Cyber Crime adalah kejahatan dunia maya yang dilakukan individu atau sekelompok orang yang menyerang sistem keamanan komputer atau data-data yang ada di dalam komputer. Kejahatan tersebut dilakukan dengan berbagai motif, mulai dari kepuasan diri hingga kejahatan yang dapat merugikan ekonomi atau politik.
        ''',
  ),
  BlogModels(
    id: 10,
    date: DateHelper.humans(DateHelper.toDateTime('26 12 2021')),
    asset: const {
      'url':
          'https://images.unsplash.com/photo-1614846027182-cecfee3a427b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
      'pdf': 'assets/pdf/tugas10(kelompok).pdf',
      'type': 'image',
    },
    title: "Tugas 10 - Internet of Things dalam bidang Transportasi",
    category: 'kelompok',
    description: '''
        Internet of things adalah suatu konsep atau program dimana sebuah objek memiliki kemampuan untuk mentransmisikan atau mengirimkan data melalui jaringan tanpa menggunakan bantuan perangkat komputer dan manusia. Saat ini, Teknologi IoT membuat kendaraan menjadi semakin ‘cerdas’. Sebuah perusahaan riset di Amerika Serikat, Gartner Inc, memprediksi akan terdapat 250 miliar kendaraan yang akan terhubung dengan Internet pada tahun 2020. Perkembangan teknologi yang begitu pesat memungkinkan siapapun dapat menggunakan teknologi yang ada untuk memenuhi kebutuhan ataupun mempermudah pekerjaan.
        ''',
  ),
  BlogModels(
    id: 11,
    date: DateHelper.humans(DateHelper.toDateTime('2 01 2022')),
    asset: const {
      'url':
          'https://images.unsplash.com/photo-1440778303588-435521a205bc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
      'pdf': 'assets/pdf/tugas-liburan.pdf',
      'type': 'image',
    },
    title:
        "Tugas Liburan - Resume Jurnal `The problem of separating the notions of “knowledge” and “information” in the knowledge society and its education`",
    category: 'individu',
    description: '''
        Internet of things adalah suatu konsep atau program dimana sebuah objek memiliki kemampuan untuk mentransmisikan atau mengirimkan data melalui jaringan tanpa menggunakan bantuan perangkat komputer dan manusia. Saat ini, Teknologi IoT membuat kendaraan menjadi semakin ‘cerdas’. Sebuah perusahaan riset di Amerika Serikat, Gartner Inc, memprediksi akan terdapat 250 miliar kendaraan yang akan terhubung dengan Internet pada tahun 2020. Perkembangan teknologi yang begitu pesat memungkinkan siapapun dapat menggunakan teknologi yang ada untuk memenuhi kebutuhan ataupun mempermudah pekerjaan.
        ''',
  ),
];
