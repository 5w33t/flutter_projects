import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tong_app/providers/firestore_provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirestoreProvider().meetingsHistory,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
          itemCount: (snapshot.data! as dynamic).docs.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(
              'Room Name: ${(snapshot.data! as dynamic).docs[index]['meetingName']}',
            ),
            subtitle: Text(
              'Joined on ${DateFormat.yMMMd().format((snapshot.data! as dynamic).docs[index]['createdAt'].toDate())}',
            ),
          ),
        );
      },
    );
  }
}
