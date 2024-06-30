'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"icons/Icon-512.png": "559f9a50b0cba4cc07aee74ca19abdf9",
"icons/Icon-maskable-192.png": "89b8998da68d2ea41984cfb364fadf86",
"icons/Icon-192.png": "89b8998da68d2ea41984cfb364fadf86",
"icons/Icon-maskable-512.png": "559f9a50b0cba4cc07aee74ca19abdf9",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/canvaskit.js.symbols": "38cba9233b92472a36ff011dc21c2c9f",
"canvaskit/skwasm.js.symbols": "741d50ffba71f89345996b0aa8426af8",
"canvaskit/chromium/canvaskit.js.symbols": "4525682ef039faeb11f24f37436dca06",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/chromium/canvaskit.wasm": "f5934e694f12929ed56a671617acd254",
"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"canvaskit/canvaskit.wasm": "3d2a2d663e8c5111ac61a46367f751ac",
"canvaskit/skwasm.wasm": "e42815763c5d05bba43f9d0337fa7d84",
"version.json": "3db58bc88805664ea65ad2112632bc68",
"favicon.png": "25d5d8819c6683073a1e4496cd8f0916",
"main.dart.js": "339353532649f70e9ba51a820bf7b210",
"assets/NOTICES": "a5c196b07e12fd9aba8c3474a78996ca",
"assets/AssetManifest.bin": "ca2334c1917d39ea3138c6a6ef0ac676",
"assets/assets/sound/solfeggio-voice/963.mp3": "5fd9df5f02bf4a9d4ff62e47386be88c",
"assets/assets/sound/solfeggio-voice/741.ogg": "a03f81d4e03492d1a9130e22e3ee6fcd",
"assets/assets/sound/solfeggio-voice/396.ogg": "8009f3323aa075c6eb35346b2f4e5228",
"assets/assets/sound/solfeggio-voice/528.mp3": "ae2d43e53c3a6bc1032463f32e83ba53",
"assets/assets/sound/solfeggio-voice/741.mp3": "080f07913d4871a1b001a573c493c5a2",
"assets/assets/sound/solfeggio-voice/852.mp3": "419bb18f174d27af44a8d90d700f459a",
"assets/assets/sound/solfeggio-voice/396.mp3": "ee145a27b0e15bf96aa58766b78fc03c",
"assets/assets/sound/solfeggio-voice/639.ogg": "462f8bc8fa145c3cd60485199606488c",
"assets/assets/sound/solfeggio-voice/417.ogg": "3fc7bd278e944c81b7fce0e29003b4ba",
"assets/assets/sound/solfeggio-voice/528.ogg": "4577bb22359c98980fc36e90c46c8e1c",
"assets/assets/sound/solfeggio-voice/963.ogg": "88b3999e2e74ad51245fa336aa9b0b6b",
"assets/assets/sound/solfeggio-voice/639.mp3": "599c18ab87a31906afe2ef63d6ab9c84",
"assets/assets/sound/solfeggio-voice/417.mp3": "d88e1e52dc9b57c0f303938910977539",
"assets/assets/sound/solfeggio-voice/852.ogg": "1a68bca95948f49ed1f4a2dd335602bb",
"assets/assets/i18n/de.json": "50534c3e5147473bf890565105f22068",
"assets/assets/i18n/it.json": "a2dae5369d8fc0abf2e578691541c146",
"assets/assets/i18n/en.json": "0f3bb5d4e83303441423dd37b368aaa3",
"assets/assets/img/chakra-map/solar-plexus.svg": "7c12999f03542951a7d5975eb20b6370",
"assets/assets/img/chakra-map/Chakras_map.svg": "bfa6c15466560317de2e2d6c61592652",
"assets/assets/img/chakra-map/third-eye.svg": "2a221c04df637e87382551eb9dd1868f",
"assets/assets/img/chakra-map/throat.svg": "f2a6f4a8f730d6a67ea618d50c3a5280",
"assets/assets/img/chakra-map/no-chakra.svg": "fcdbf89c3769d1302e8686c70a8d74d7",
"assets/assets/img/chakra-map/chakra-map-base-2.svg": "4a21b513c1a567e27d163acfa138c4c3",
"assets/assets/img/chakra-map/Chakras-map-base.svg": "c91556b14412c387c9289d447bad664a",
"assets/assets/img/chakra-map/Chakras_map.svg.license": "30f72c476e172547eec0d8857eebc8b3",
"assets/assets/img/chakra-map/heart.svg": "0e79cc410b3078cd5a0c848607cef63a",
"assets/assets/img/chakra-map/glow.svg": "46f05c437f86d98b4e475bc703e8f5d4",
"assets/assets/img/chakra-map/sacral.svg": "f909da8fb26049a7e626dda8e5d1aa01",
"assets/assets/img/chakra-map/root.svg": "80e846cc99fd5c90bfbfae761a32e73a",
"assets/assets/img/chakra-map/crown.svg": "849d9960ae244044c15f4a0b3356ba82",
"assets/assets/img/layout/top-wave.svg": "57959ef5e18d7d6a807da3226d0ac74a",
"assets/assets/img/icon/icon.svg": "00fa6a52b8460daaf36d0c572972a53a",
"assets/assets/img/icon/flatpak.svg": "e06540c48d5a2f54caea03b857f5bdf8",
"assets/assets/img/icon/icon-128.png": "574386d42fa7e53d77b6ce4a97990b17",
"assets/assets/img/icon/icon-512.png": "8aa18ea01f3871c13f332da847f2f4d9",
"assets/assets/img/icon/icon-256.png": "9f7f3492913181ce4a2bed1f8f98515a",
"assets/assets/img/chakra-icons/solar-plexus.svg": "8579fc920b1fde11daea20c98f352b98",
"assets/assets/img/chakra-icons/third-eye.svg": "e374b4bae29d96111e95355e503072da",
"assets/assets/img/chakra-icons/throat.svg": "1445a0c0985ce0ff4202e776be2a9b35",
"assets/assets/img/chakra-icons/no-chakra.svg": "2590ea0d0dec51f4897bdb34369fd100",
"assets/assets/img/chakra-icons/heart.svg": "5f28babd26a2808d72052c9fa0e2483e",
"assets/assets/img/chakra-icons/glow.svg": "739e3e112a9859cfe9e0da32bb875c00",
"assets/assets/img/chakra-icons/sacral.svg": "66cceaa269ba96df6f8bcea6af3dae35",
"assets/assets/img/chakra-icons/root.svg": "6af02b536f9966e48f2be11d74c83160",
"assets/assets/img/chakra-icons/crown.svg": "c9490b08e426e3288518f9482ec0b1a3",
"assets/assets/img/license/sa.svg": "978acd9d54dfd3c39cd92e8acfe1fe7e",
"assets/assets/img/license/cc.svg": "e3defa79f640d165173a6d2a6ea3c900",
"assets/assets/img/license/by.svg": "7813b5794d8ba96aec20acb7f14ff76a",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "decfd39d050d75c1a892f1bdc2ccd1af",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "f3307f62ddff94d2cd8b103daf8d1b0f",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "b392c64816c3c79d6e4b75fcf7396761",
"assets/AssetManifest.bin.json": "1cd9c63df45de9f89391edca0153704e",
"assets/FontManifest.json": "3ddd9b2ab1c2ae162d46e3cc7b78ba88",
"assets/fonts/MaterialIcons-Regular.otf": "db4d9710d24ada4315785fcff6238e36",
"assets/AssetManifest.json": "ac99308a70c1f93350de4d39c4baa097",
"CNAME": "516e1f65e825ec33c2e64479472752fe",
"index.html": "af7e18118e69c15daac9a73cc89774b1",
"/": "af7e18118e69c15daac9a73cc89774b1",
"manifest.json": "fb49ffa297eec4f88c0eea0dc656228d"};
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
