import '../models/bird.dart';

// TODO: isi dengan URL thumbnail YouTube trailer/film Angry Birds,
// contoh: "https://img.youtube.com/vi/<VIDEO_ID>/hqdefault.jpg"
// Kalau kosong, carousel di halaman detail otomatis disembunyikan.
const List<String> _trailers = [];

final List<Bird> dataBirds = [
  Bird(
    name: "Red",
    image: "assets/red.jpeg",
    type: "Leader",
    description:
    "Red adalah pemimpin tak resmi dari para burung di Piggy Island. Sifatnya mudah marah dan meledak-ledak, tetapi di balik itu ia sangat setia dan siap pasang badan demi melindungi telur-telur kawanannya.\n\nSaat diluncurkan dari ketapel, Red menghantam sasaran dengan kekuatan seimbang. Keberaniannya sering menjadi pemicu semangat seluruh kawanan untuk menghadapi para babi hijau.",
    power: 300,
    skills: ["Fierce Dive", "Battle Cry", "Rally Flock", "Head Slam"],
    movies: _trailers,
    ability: "Leadership",
    stats: {"Power": 60, "Speed": 55, "Accuracy": 70, "Destruction": 55},
  ),
  Bird(
    name: "Chuck",
    image: "assets/chuck.jpeg",
    type: "Speed",
    description:
    "Chuck adalah burung kuning yang super cepat dan sangat percaya diri. Ia suka bicara cepat, bergerak cepat, dan tidak pernah bisa diam lama-lama.\n\nSaat diketuk di udara, Chuck melesat dengan kecepatan berlipat ganda. Kemampuan ini membuatnya sangat efektif untuk menembus dan menghancurkan struktur kayu.",
    power: 340,
    skills: ["Speed Boost", "Dash Strike", "Wood Breaker", "Zigzag Flight"],
    movies: _trailers,
    ability: "Speed Boost",
    stats: {"Power": 55, "Speed": 95, "Accuracy": 65, "Destruction": 60},
  ),
  Bird(
    name: "Bomb",
    image: "assets/bomb.jpeg",
    type: "Explosive",
    description:
    "Bomb adalah burung hitam bertubuh bulat yang berhati lembut dan tenang, tetapi ia punya satu masalah: ia meledak ketika emosinya naik atau ketika menyentuh sesuatu dengan keras.\n\nLedakan Bomb mampu meruntuhkan bangunan batu dan menjatuhkan babi-babi yang bersembunyi di dalamnya. Ia adalah andalan kawanan untuk menyelesaikan benteng yang kokoh.",
    power: 520,
    skills: ["Big Bang", "Shockwave", "Stone Crusher", "Chain Blast"],
    movies: _trailers,
    ability: "Explode",
    stats: {"Power": 90, "Speed": 40, "Accuracy": 55, "Destruction": 98},
  ),
  Bird(
    name: "Matilda",
    image: "assets/matilda.jpeg",
    type: "Egg Bomber",
    description:
    "Matilda adalah burung putih yang bijaksana dan penuh kasih. Ia sering menjadi penengah dan penenang ketika kawanan sedang tegang.\n\nSaat diketuk, ia menjatuhkan telur peledak ke arah bawah sambil terbang melesat ke atas. Serangan dari atas ini sangat efektif untuk menghancurkan target yang sulit dijangkau.",
    power: 380,
    skills: ["Egg Drop", "Wing Boost", "Calm Aura", "Sky Bomb"],
    movies: _trailers,
    ability: "Egg Bomb",
    stats: {"Power": 70, "Speed": 60, "Accuracy": 75, "Destruction": 72},
  ),
  Bird(
    name: "The Blues",
    image: "assets/blues.jpeg",
    type: "Splitter",
    description:
    "The Blues terdiri dari tiga bersaudara kecil: Jay, Jake, dan Jim. Meski tubuhnya mungil, mereka sangat lincah dan selalu kompak dalam melakukan apa saja.\n\nSaat diketuk di udara, satu burung terpecah menjadi tiga dan menyebar ke berbagai arah. Mereka sangat jago menghancurkan struktur kaca.",
    power: 240,
    skills: ["Triple Split", "Glass Breaker", "Scatter Shot", "Team Dash"],
    movies: _trailers,
    ability: "Split",
    stats: {"Power": 35, "Speed": 70, "Accuracy": 60, "Destruction": 50},
  ),
  Bird(
    name: "Terence",
    image: "assets/terence.jpeg",
    type: "Heavy",
    description:
    "Terence adalah burung merah raksasa yang pendiam dan nyaris tidak pernah bicara. Tubuhnya yang besar membuatnya tampak menakutkan, padahal ia sangat setia pada kawanannya.\n\nBobot tubuhnya yang luar biasa membuat setiap benturan terasa seperti hantaman palu raksasa. Ia sangat ampuh untuk memecahkan struktur batu.",
    power: 560,
    skills: ["Heavy Slam", "Stone Smasher", "Ground Pound", "Iron Charge"],
    movies: _trailers,
    ability: "Massive Body",
    stats: {"Power": 98, "Speed": 30, "Accuracy": 50, "Destruction": 95},
  ),
  Bird(
    name: "Hal",
    image: "assets/hal.jpeg",
    type: "Boomerang",
    description:
    "Hal adalah burung toucan hijau yang santai dan sedikit ceroboh. Ia terkenal dengan paruhnya yang melengkung dan gaya terbangnya yang unik.\n\nSaat diketuk, Hal berbalik arah dan meluncur kembali seperti bumerang. Serangan dari belakang ini sering mengejutkan babi yang merasa sudah aman.",
    power: 360,
    skills: ["Boomerang Turn", "Rear Attack", "Wood Slicer", "Curve Flight"],
    movies: _trailers,
    ability: "Boomerang",
    stats: {"Power": 65, "Speed": 70, "Accuracy": 80, "Destruction": 65},
  ),
  Bird(
    name: "Bubbles",
    image: "assets/bubbles.jpeg",
    type: "Inflater",
    description:
    "Bubbles adalah burung oranye yang ceria dan penuh energi. Ia gemar bercanda dan tertawa, bahkan di saat situasi sedang genting.\n\nSaat diketuk, tubuhnya menggembung besar seperti balon dan mendorong semua yang ada di sekitarnya. Kemampuan ini ampuh untuk menjatuhkan tumpukan balok dan menyingkirkan penghalang.",
    power: 330,
    skills: ["Inflate", "Push Wave", "Bounce Back", "Balloon Burst"],
    movies: _trailers,
    ability: "Inflate",
    stats: {"Power": 60, "Speed": 50, "Accuracy": 60, "Destruction": 68},
  ),
  Bird(
    name: "Stella",
    image: "assets/stella.jpeg",
    type: "Bubble",
    description:
    "Stella adalah burung merah muda yang berani, mandiri, dan sangat peduli pada teman-temannya. Ia tidak segan memimpin ketika keadaan membutuhkan.\n\nStella dapat menciptakan gelembung ajaib yang mengurung dan mengangkat target. Setelah terperangkap, target dijatuhkan dengan keras ke tanah.",
    power: 390,
    skills: ["Bubble Trap", "Lift Up", "Drop Strike", "Pink Rush"],
    movies: _trailers,
    ability: "Bubble Trap",
    stats: {"Power": 62, "Speed": 65, "Accuracy": 78, "Destruction": 64},
  ),
  Bird(
    name: "Mighty Eagle",
    image: "assets/mighty_eagle.jpeg",
    type: "Legend",
    description:
    "Mighty Eagle adalah elang legendaris yang tinggal sendirian di puncak gunung dan dihormati sebagai pahlawan terkuat, meski sifatnya sombong dan suka pamer.\n\nIa hanya turun tangan saat dipanggil dengan kaleng sarden. Sekali menukik, ia sanggup meratakan benteng babi dalam satu hantaman.",
    power: 900,
    skills: ["Sardine Call", "Mighty Dive", "Eagle Screech", "Total Destruction"],
    movies: _trailers,
    ability: "Mighty Strike",
    stats: {"Power": 100, "Speed": 90, "Accuracy": 85, "Destruction": 100},
  ),
];