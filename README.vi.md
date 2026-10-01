<div align="center">

![AltSource Center](https://cdn.jsdelivr.net/gh/XiaoZhang-qd/AltSource-Center@main/web/assets/logo.svg)

</div>

[English](README.md) · [简体中文](README.zh-CN.md) · [繁體中文](README.zh-TW.md) · [日本語](README.ja.md) · [한국어](README.ko.md) · Tiếng Việt · [Español](README.es.md) · [Français](README.fr.md) · [Deutsch](README.de.md) · [Русский](README.ru.md) · [Português](README.pt.md) · [Italiano](README.it.md) · [العربية](README.ar.md) · [עברית](README.he.md)

# AltSource Center

Trình duyệt AltSource cho iPhone/iPad, ưu tiên C11 và cục bộ. Giao diện được đóng gói hoàn toàn trong IPA và được thiết kế giống danh mục phần mềm kiểu F-Droid: **Nguồn → Ứng dụng → Chi tiết → Lấy / Thêm nguồn**.

## Những thay đổi

Kho lưu trữ này hiện kết hợp vỏ bọc native gốc của AltSource Center với mô hình tương tác hữu ích của AltDirect và AltSource Viewer:

- Thư viện nguồn cục bộ.
- Nút Thêm Nguồn và chi tiết nguồn.
- Trang ứng dụng có tìm kiếm.
- Luồng Lấy cho từng ứng dụng.
- Luồng Thêm Nguồn riêng biệt.
- Trang khách hàng URL với sổ đăng ký trình xử lý có thể chỉnh sửa.
- Hỗ trợ English / 简体中文 / 繁體中文 và nhiều ngôn ngữ giao diện khác.
- Xuất/nhập cục bộ thư viện nguồn.
- IPA chứa toàn bộ front-end `web/`; không phải gói một liên kết trang web từ xa.
- Lõi C11 vẫn chịu trách nhiệm cho mô hình trình xử lý; iOS dùng cầu nối UIKit/WebKit nhỏ.
- Trang chủ có nút sao chép URL Web hiện tại và liên kết đến GitHub Releases.

## Hỗ trợ giao thức URL

Dự án cố ý điều khiển bằng cấu hình. Không có danh sách chính thức duy nhất cho mọi khách hàng tương thích AltSource, và hỗ trợ nguồn không ngụ ý hỗ trợ cài đặt IPA. Giao thức URL có thể thay đổi giữa các phiên bản khách hàng.

Các trình xử lý nguồn hiện tại:

- AltStore Classic — `altstore-classic://source?url=...`
- SideStore — `sidestore://source?url=...`
- Feather — `feather://source/...`
- LiveContainer — `livecontainer://sources?url=...`
- StikStore — `stikstore://add-source?url=...`
- TrollApps — `trollapps://add?url=...`
- FlareStore — `flarestore://source?url=...`
- ESign — `esign://addsource?url=...`
- Ksign — `ksign://addsource?url=...`
- GBox — `gbox://AddSource/...`
- KravaSigner — `kravasigner://addRepo=...`

Các hành động URL cài đặt chỉ được cung cấp khi có triển khai được tài liệu hóa hỗ trợ:

- AltStore — `altstore://install?url=...`
- SideStore — `sidestore://install?url=...`
- Feather — `feather://install/...`
- ESign — `esign://install?url=...`
- Ksign — `ksign://install?url=...`

Sổ đăng ký có thể chỉnh sửa nằm tại `src/resources/url_handlers.json`. Giao diện Web sử dụng cùng danh sách trong `web/js/app.js`.

## Ghi chú phát hành

Sau mỗi lần Action xây dựng iOS thành công, ghi chú phát hành sẽ được cập nhật với các giao thức URL nguồn và IPA có sẵn.

## Xây dựng cục bộ với Theos SDK

Bộ SDK được kỳ vọng tại `$THEOS_SDKS` hoặc `$HOME/theos/sdks`.

```bash
git clone --depth 1 https://github.com/theos/sdks.git ~/theos/sdks
export THEOS_SDKS="$HOME/theos/sdks"

./build/local/build-ios.sh --list-sdks
./build/local/build-ios.sh --sdk 18.6 --target 13.0 --arch arm64
```

Script cục bộ cho phép bạn chọn phiên bản SDK thiết bị và mục tiêu triển khai. Nó tạo IPA ad-hoc mặc định; sử dụng định danh ký của riêng bạn với `--sign` khi cần.

## GitHub Actions

Quy trình IPA là **chỉ thủ công**. Không có trigger push hoặc pull-request.

Vào:

**Actions → Build iOS IPAs (manual) → Run workflow**

Quy trình:

1. Kiểm tra kho lưu trữ này.
2. Kiểm tra `theos/sdks`.
3. Tìm mọi `iPhoneOS*.sdk` có sẵn.
4. Xây dựng IPA arm64 cho mỗi SDK thiết bị.
5. Tạo hoặc cập nhật GitHub Release và tải lên các IPA đã tạo.
6. Sau khi xây dựng thành công, cập nhật ghi chú phát hành với thông tin giao thức URL nguồn và IPA.

## GitHub Pages

Quy trình Pages cũng chỉ chạy thủ công. Nó xuất bản thư mục `web/` khi bạn chạy quy trình một cách rõ ràng.

Giao diện Web: https://xiaozhang-qd.github.io/AltSource-Center/web

## Tham chiếu upstream

Thiết kế tính năng được tham khảo từ:

- AltDirect: https://github.com/StikDebug/altdirect
- AltSource Viewer: https://github.com/therealFoxster/altsource-viewer
- Theos SDKs: https://github.com/theos/sdks

Kho lưu trữ này là triển khai clean-room. Tên và giao thức URL bên thứ ba được tham chiếu cho khả năng tương thích; triển khai không yêu cầu thương hiệu/tài sản bên thứ ba.

## Giới hạn quan trọng

Ứng dụng này là **trình khởi chạy/danh mục URL**, không phải công cụ ký. Nhấn Lấy hoặc Thêm Nguồn sẽ gọi giao thức URL của khách hàng đã chọn (hoặc mở IPA được lưu trữ). Hành vi ký/cài đặt thực tế thuộc về khách hàng đó.

## Giấy phép

MIT.

## Liên kết trực tiếp

Mirror source: https://xiaozhang-qd.github.io/AltSource-Center/web/source.json

### Nhập nguồn mirror

- [AltStore Classic](altstore-classic://source?url=https%3A%2F%2Fxiaozhang-qd.github.io%2FAltSource-Center%2Fweb%2Fsource.json)
- [SideStore](sidestore://source?url=https%3A%2F%2Fxiaozhang-qd.github.io%2FAltSource-Center%2Fweb%2Fsource.json)
- [Feather](feather://source/https%3A%2F%2Fxiaozhang-qd.github.io%2FAltSource-Center%2Fweb%2Fsource.json)
- [LiveContainer](livecontainer://sources?url=https%3A%2F%2Fxiaozhang-qd.github.io%2FAltSource-Center%2Fweb%2Fsource.json)
- [StikStore](stikstore://add-source?url=https%3A%2F%2Fxiaozhang-qd.github.io%2FAltSource-Center%2Fweb%2Fsource.json)
- [TrollApps](trollapps://add?url=https%3A%2F%2Fxiaozhang-qd.github.io%2FAltSource-Center%2Fweb%2Fsource.json)
- [FlareStore](flarestore://source?url=https%3A%2F%2Fxiaozhang-qd.github.io%2FAltSource-Center%2Fweb%2Fsource.json)
- [ESign](esign://addsource?url=https%3A%2F%2Fxiaozhang-qd.github.io%2FAltSource-Center%2Fweb%2Fsource.json)
- [Ksign](ksign://addsource?url=https%3A%2F%2Fxiaozhang-qd.github.io%2FAltSource-Center%2Fweb%2Fsource.json)
- [GBox](gbox://AddSource/https%3A%2F%2Fxiaozhang-qd.github.io%2FAltSource-Center%2Fweb%2Fsource.json)
- [KravaSigner](kravasigner://addRepo=https%3A%2F%2Fxiaozhang-qd.github.io%2FAltSource-Center%2Fweb%2Fsource.json)

### Cài đặt IPA

Current IPA: https://github.com/XiaoZhang-qd/AltSource-Center/releases/download/v2.0.3/AltSourceCenter-iOS-13.7-arm64.ipa

- [AltStore](altstore://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [SideStore](sidestore://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [Feather](feather://install/https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [LiveContainer](livecontainer://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [ESign](esign://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)
- [Ksign](ksign://install?url=https%3A%2F%2Fgithub.com%2FXiaoZhang-qd%2FAltSource-Center%2Freleases%2Fdownload%2Fv2.0.3%2FAltSourceCenter-iOS-13.7-arm64.ipa)

> These links require the corresponding client to be installed. URL schemes can change between client versions.
