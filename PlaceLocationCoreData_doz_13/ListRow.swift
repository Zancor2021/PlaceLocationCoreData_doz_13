
import SwiftUI

struct ListRow: View {
  let place: Place
  static let releaseFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    return formatter
  }()

  var body: some View {
    VStack(alignment: .leading) {
      place.title.map(Text.init)
        .font(.title)
      HStack {
       Text("\(place.category)")
          .font(.caption)
        Spacer()
       Text("\(place.ranking)")
       .font(.caption)
      }
    }
  }
}
