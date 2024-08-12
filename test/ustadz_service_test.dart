// import 'package:dio/dio.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
// import 'package:find_kajian/service/ustadz_service/ustadz_service.dart';

// // Generate MockDio using Mockito
// @GenerateMocks([Dio])
// import 'ustadz_service_test.mocks.dart';

// void main() {
//   group('UstadzService', () {
//     late MockDio mockDio;
//     late UstadzService ustadzService;

//     setUp(() {
//       mockDio = MockDio();
//       ustadzService = UstadzService(dio: mockDio);
//     });

//     test('search returns data when the response is successful', () async {
//       // Arrange
//       final query = 'Abu Yusuf';
//       final mockResponse = {
//         "message": "Data retrieved successfully",
//         "data": [
//           {
//             "id": 2,
//             "nama": "Ustadz Abu Yusuf Ubaid Bima",
//             "deskripsi": "Kedokteran Islam dan Aqidah",
//             "alamat":
//                 "Jl. Toddopuli Raya No.79, Paropo, Kec. Panakkukang, Kota Makassar, Sulawesi Selatan",
//             "phone": "0895335101602",
//             "youtube": "https://www.youtube.com/@AbuYusufUbaidBimaofficial",
//             "created_at": "2023-08-21T09:47:48.000000Z",
//             "updated_at": "2023-08-21T09:47:48.000000Z",
//             "photo": "no_photo.jpg"
//           }
//         ]
//       };

//       when(mockDio.get(
//         any,
//         queryParameters: anyNamed('queryParameters'),
//         options: anyNamed('options'),
//       )).thenAnswer((_) async => Response(
//           data: mockResponse,
//           statusCode: 200,
//           requestOptions: RequestOptions(path: '')));

//       // Act
//       final result = await ustadzService.search(query);

//       // Assert
//       expect(result, mockResponse);
//       verify(mockDio.get(
//         any,
//         queryParameters: {'query': query},
//         options: anyNamed('options'),
//       )).called(1);
//     });

//     test('search throws an exception when the response is unsuccessful',
//         () async {
//       // Arrange
//       final query = 'Abu Yusuf';
//       when(mockDio.get(
//         any,
//         queryParameters: anyNamed('queryParameters'),
//         options: anyNamed('options'),
//       )).thenAnswer((_) async => Response(
//           data: 'Something went wrong',
//           statusCode: 400,
//           requestOptions: RequestOptions(path: '')));

//       // Act
//       expect(
//         () => ustadzService.search(query),
//         throwsA(isA<Exception>()),
//       );

//       // Assert
//       verify(mockDio.get(
//         any,
//         queryParameters: {'query': query},
//         options: anyNamed('options'),
//       )).called(1);
//     });
//   });
// }
