# 🌿 PlantWhisperApp

> **AI-powered plant identifier and care scheduler for iOS**  
> Snap a photo. Know your plant. Never forget to water it again.

![Swift](https://img.shields.io/badge/Swift-5.9-orange?logo=swift&logoColor=white)
![iOS](https://img.shields.io/badge/iOS-17%2B-blue?logo=apple&logoColor=white)
![SwiftUI](https://img.shields.io/badge/SwiftUI-Framework-purple?logo=swift&logoColor=white)
![SwiftData](https://img.shields.io/badge/SwiftData-Storage-green)
![OpenAI](https://img.shields.io/badge/OpenAI-GPT--4o--mini-black?logo=openai&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-yellow)

---

## 📱 Demo

> _Record a Simulator screen capture and drop the GIF here_

```
[ Place demo GIF here — 30s Simulator recording converted via ezgif.com ]
```

---

## ✨ Features

| Feature | Description |
|---|---|
| 🔍 **AI Plant Identification** | Identify any plant species from a photo in 2–3 seconds using GPT-4o-mini vision |
| 💧 **Watering Scheduler** | AI returns exact watering frequency — app sets a local reminder automatically |
| ☀️ **Sunlight Guide** | Full sun, partial shade, or indirect light — with placement tips for your home |
| 🦠 **Disease Detection** | Spots yellow leaves, pests, or wilting from the photo and suggests treatment |
| 🌱 **My Garden Library** | All identified plants saved locally, searchable by name or family |
| 🔔 **Smart Reminders** | Local push notifications — no backend or server required |
| 📤 **Care Card Sharing** | Export a plant care summary to share with friends |

---

## 🏗️ Architecture

```
┌─────────────────────────────────────────────────────────┐
│                      PlantWhisper                        │
│                                                          │
│  ┌──────────┐    ┌─────────────────┐    ┌────────────┐  │
│  │  Camera  │───▶│ PlantAIService  │───▶│  OpenAI    │  │
│  │  Picker  │    │  (async/await)  │    │ GPT-4o-mini│  │
│  └──────────┘    └────────┬────────┘    └────────────┘  │
│                           │                              │
│                  ┌────────▼────────┐                     │
│                  │   PlantResult   │                     │
│                  │ (Codable JSON)  │                     │
│                  └────────┬────────┘                     │
│            ┌──────────────┼──────────────┐               │
│            ▼              ▼              ▼               │
│       ┌─────────┐  ┌───────────┐  ┌──────────┐          │
│       │SwiftData│  │Notification│  │  Result  │          │
│       │(Storage)│  │ Service   │  │   View   │          │
│       └─────────┘  └───────────┘  └──────────┘          │
└─────────────────────────────────────────────────────────┘
```

**Data flow:**
1. User captures or picks a photo
2. `PlantAIService` base64-encodes the image and sends it to GPT-4o-mini
3. AI returns structured JSON — plant name, watering days, sunlight, disease
4. Result is displayed, saved to SwiftData, and a local notification is scheduled

---

## 🛠️ Tech Stack

| Layer | Technology | Why |
|---|---|---|
| **UI** | SwiftUI | Declarative, modern, fast to build |
| **Local Storage** | SwiftData (`@Model`, `@Query`) | iOS 17+ replacement for Core Data — much simpler |
| **AI / Vision** | OpenAI GPT-4o-mini | Vision API, free tier (200 req/day), structured JSON output |
| **Camera** | UIImagePickerController | Handles both camera and photo library |
| **Notifications** | UNUserNotificationCenter | Local-only, no server needed, calendar triggers |
| **Networking** | URLSession + async/await | Native Swift concurrency, no third-party libraries |
| **State** | `@Observable` macro | iOS 17 observation framework |

---

## 📂 Project Structure

```
PlantWhisper/
├── App/
│   └── PlantWhisperApp.swift       # App entry, modelContainer setup
├── Models/
│   └── PlantEntry.swift            # SwiftData @Model — persisted plant data
├── Services/
│   ├── PlantAIService.swift        # OpenAI GPT-4o-mini vision API
│   └── NotificationService.swift  # Local push notification scheduling
├── Views/
│   ├── HomeView.swift              # Main scan screen
│   ├── PlantResultView.swift       # AI result display
│   ├── GardenView.swift            # My Garden list + search
│   ├── PlantDetailView.swift       # Individual plant detail
│   └── Components/
│       ├── StatChip.swift
│       ├── PlantRowView.swift
│       ├── LoadingView.swift
│       └── ErrorView.swift
├── ViewModels/
│   └── HomeViewModel.swift         # @Observable state management
├── Utilities/
│   └── CameraPickerView.swift      # UIViewControllerRepresentable
└── Secrets.swift                   # ⚠️ Not committed — see Setup
```

---

## 🚀 Getting Started

### Prerequisites

- Xcode 15+
- iOS 17+ device or Simulator
- OpenAI API key ([get one free here](https://platform.openai.com/signup))

### Setup

**1. Clone the repo**
```bash
git clone https://github.com/yourusername/PlantWhisper.git
cd PlantWhisper
```

**2. Add your OpenAI API key**

Create a file called `Secrets.swift` in the `PlantWhisper/` folder (this file is gitignored):

```swift
// Secrets.swift
enum Secrets {
    static let openAIKey = "sk-your-openai-key-here"
}
```

> **Note:** Never commit this file. A `Secrets.swift.example` is provided as a template.

**3. Open and run**
```bash
open PlantWhisper.xcodeproj
```

Select your target device or Simulator, then press `⌘R` to run.

---

## 🔑 API Usage & Limits

This app uses the **OpenAI GPT-4o-mini** model with vision on the free tier:

| Limit | Value |
|---|---|
| Free requests/day | ~200 |
| Model | `gpt-4o-mini` |
| Image detail | `low` (reduces token usage) |
| Max tokens per response | 500 |

The `"detail": "low"` setting is intentional — it significantly reduces cost and is sufficient for plant identification. Notifications are fully local and require no API calls.

---

## 📸 Screenshots

| Home Screen | Result Card | My Garden |
|---|---|---|
| _(screenshot)_ | _(screenshot)_ | _(screenshot)_ |

---

## 💡 How the AI Prompt Works

The app sends a carefully structured prompt to ensure consistent, parseable JSON every time:

```swift
let prompt = """
Identify the plant in this image.
Return ONLY valid JSON with no markdown or explanation:
{
  "commonName": "string",
  "scientificName": "string",
  "family": "string",
  "wateringDays": number,
  "sunlight": "Full sun|Partial shade|Indirect light",
  "careTips": ["tip1", "tip2"],
  "disease": "description or null",
  "healthStatus": "Healthy|Needs attention|Unhealthy",
  "difficulty": "Easy|Medium|Hard"
}
If no plant is visible, return {"error": "No plant detected"}.
"""
```

This approach (JSON-only prompt with enum constraints) ensures the response can be decoded directly with Swift's `Codable` without any string parsing or cleanup.

---

## 🔒 Privacy

- **No data leaves your device** except the plant photo sent to OpenAI for identification
- Photos are compressed to JPEG quality 0.8 before transmission
- All plant data (names, care schedules, photos) stored locally in SwiftData
- Notifications are local-only — no push notification server

---

## 🗺️ Roadmap

- [ ] Widget showing next watering countdown
- [ ] Siri Shortcuts integration ("Hey Siri, when should I water my Monstera?")
- [ ] Plant growth journal with photo timeline
- [ ] Offline identification via on-device Core ML model
- [ ] iCloud sync across devices
- [ ] Plant community — share your garden with friends

---

## 🤝 Contributing

Pull requests are welcome! For major changes, please open an issue first to discuss what you'd like to change.

1. Fork the repo
2. Create your feature branch: `git checkout -b feature/amazing-feature`
3. Commit your changes: `git commit -m 'Add amazing feature'`
4. Push to the branch: `git push origin feature/amazing-feature`
5. Open a Pull Request

---

## 📄 License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgements

- [OpenAI](https://openai.com) for the GPT-4o-mini vision API
- [Apple SwiftData](https://developer.apple.com/xcode/swiftdata/) for the elegant local persistence layer
- Plant identification accuracy powered by GPT-4o-mini's vision capabilities

---

<p align="center">Built with 🌿 and SwiftUI</p>
