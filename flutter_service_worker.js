'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"index.html": "9f91bdff8d888acd553be3423aa46f9c",
"/": "9f91bdff8d888acd553be3423aa46f9c",
"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/skwasm.wasm": "e42815763c5d05bba43f9d0337fa7d84",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/chromium/canvaskit.wasm": "f5934e694f12929ed56a671617acd254",
"canvaskit/chromium/canvaskit.js.symbols": "4525682ef039faeb11f24f37436dca06",
"canvaskit/canvaskit.wasm": "3d2a2d663e8c5111ac61a46367f751ac",
"canvaskit/skwasm.js.symbols": "741d50ffba71f89345996b0aa8426af8",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/canvaskit.js.symbols": "38cba9233b92472a36ff011dc21c2c9f",
"favicon.png": "c8f0c15d5e3e78356b37a5f78fe530e3",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "0db35ae7a415370b89e807027510caf0",
"assets/AssetManifest.bin.json": "4fdcff5fbec15bc5311e57c1dc0c1e20",
"assets/assets/sound/solfeggio-voice/396.mp3": "ee145a27b0e15bf96aa58766b78fc03c",
"assets/assets/sound/solfeggio-voice/963.ogg": "88b3999e2e74ad51245fa336aa9b0b6b",
"assets/assets/sound/solfeggio-voice/852.ogg": "1a68bca95948f49ed1f4a2dd335602bb",
"assets/assets/sound/solfeggio-voice/639.ogg": "462f8bc8fa145c3cd60485199606488c",
"assets/assets/sound/solfeggio-voice/396.ogg": "8009f3323aa075c6eb35346b2f4e5228",
"assets/assets/sound/solfeggio-voice/852.mp3": "419bb18f174d27af44a8d90d700f459a",
"assets/assets/sound/solfeggio-voice/963.mp3": "5fd9df5f02bf4a9d4ff62e47386be88c",
"assets/assets/sound/solfeggio-voice/741.ogg": "a03f81d4e03492d1a9130e22e3ee6fcd",
"assets/assets/sound/solfeggio-voice/417.mp3": "d88e1e52dc9b57c0f303938910977539",
"assets/assets/sound/solfeggio-voice/741.mp3": "080f07913d4871a1b001a573c493c5a2",
"assets/assets/sound/solfeggio-voice/528.ogg": "4577bb22359c98980fc36e90c46c8e1c",
"assets/assets/sound/solfeggio-voice/639.mp3": "599c18ab87a31906afe2ef63d6ab9c84",
"assets/assets/sound/solfeggio-voice/417.ogg": "3fc7bd278e944c81b7fce0e29003b4ba",
"assets/assets/sound/solfeggio-voice/528.mp3": "ae2d43e53c3a6bc1032463f32e83ba53",
"assets/assets/img/chakra-map/crown.svg": "d26beae18f4cb9eb88538c6b0e409ffc",
"assets/assets/img/chakra-map/throat.svg": "ead6e0b783f59ad75a4f5d8844a37842",
"assets/assets/img/chakra-map/root.svg": "93f2f1535637045af2abd40857a610fa",
"assets/assets/img/chakra-map/no-chakra.svg": "e8b4d8fc104cc3f38b19944f695a86f4",
"assets/assets/img/chakra-map/Chakras-map-base.svg": "c91556b14412c387c9289d447bad664a",
"assets/assets/img/chakra-map/Chakras_map.svg.license": "30f72c476e172547eec0d8857eebc8b3",
"assets/assets/img/chakra-map/Chakras_map.svg": "bfa6c15466560317de2e2d6c61592652",
"assets/assets/img/chakra-map/sacral.svg": "ab0cef9d26fdae60e5b632796fe6c484",
"assets/assets/img/chakra-map/chakra-map-base-2.svg": "4a21b513c1a567e27d163acfa138c4c3",
"assets/assets/img/chakra-map/third-eye.svg": "18d94f5a3b804395ef4533a35f882390",
"assets/assets/img/chakra-map/heart.svg": "f0cf78d942fbd55fe8c1558894fa84d2",
"assets/assets/img/chakra-map/solar-plexus.svg": "f6b151c180f286d16145a7028a849503",
"assets/assets/img/layout/top-wave.svg": "57959ef5e18d7d6a807da3226d0ac74a",
"assets/assets/img/icon/icon-128.png": "73784b149378e7bcc20798c37d89170c",
"assets/assets/img/icon/icon.svg": "572d78b6f728056beeb3d3b2661f60ce",
"assets/assets/img/icon/icon-512.png": "ce4e0fada883adaab466087c2dd083f9",
"assets/assets/img/icon/icon-256.png": "0bd3cf94702d45e8785eb44ac4176a47",
"assets/assets/img/chakra-icons/crown.svg": "be476685324ba119eb436d10dd5d582b",
"assets/assets/img/chakra-icons/throat.svg": "ce6fa39730e3ef7eb5b0e45e56aa8d72",
"assets/assets/img/chakra-icons/root.svg": "562d8e8a84c707946ef84eab51397924",
"assets/assets/img/chakra-icons/no-chakra.svg": "a040415124c3ad869710e269ccdbac11",
"assets/assets/img/chakra-icons/sacral.svg": "bb63db55de02bdf47f4488d7d2f5c598",
"assets/assets/img/chakra-icons/third-eye.svg": "569fe0e41ff4dcd896086a84cb3feeca",
"assets/assets/img/chakra-icons/heart.svg": "0be25275d1eaeaa7305608e69351d28a",
"assets/assets/img/chakra-icons/solar-plexus.svg": "c50465b6c5c2f09fe59d52616c34132b",
"assets/assets/i18n/en.json": "9648b4f57a545045c9bc7a7f136681e5",
"assets/AssetManifest.bin": "0905826c2fd8540d54c7966cb73aee60",
"assets/NOTICES": "1a339ca895ce16c7ae99df36b5987f05",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/AssetManifest.json": "c840ff710157d5279c43b4f8c5260d66",
"version.json": "e63bb1175c1f97e53eda3e9490557257",
"icons/Icon-512.png": "c2bd631853b7bfeedf9de9bb94be8759",
"icons/Icon-maskable-192.png": "fc679fd0594dde895af428981f03555b",
"icons/Icon-maskable-512.png": "c2bd631853b7bfeedf9de9bb94be8759",
"icons/Icon-192.png": "fc679fd0594dde895af428981f03555b",
"manifest.json": "fb49ffa297eec4f88c0eea0dc656228d",
"CNAME": "516e1f65e825ec33c2e64479472752fe",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"main.dart.js": "fafb16184ed9c43e8b5ba8a567b6e1b7"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
