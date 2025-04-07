import 'package:apktest/text.dart';
import 'package:teledart/model.dart' as td;
import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';

void main() async {
  final botToken = "7919963471:AAH_80IECrKTbf0HJ5Dz3moo-R29w1BK08Y";
  final username = (await Telegram(botToken).getMe()).username;
  final teledart = TeleDart(botToken, Event(username!));
  teledart.start();

  print('Bot started...');

  teledart.setMyCommands([
    td.BotCommand(command: 'start', description: 'شروع'),
  ]);

  teledart.onCommand('start').listen((message) {
    final chatId = message.chat.id;
    var keyboardRead = td.ReplyKeyboardMarkup(
      keyboard: [
        [
          td.KeyboardButton(text: 'آره'),
          td.KeyboardButton(text: 'معلومه که میخوام'),
        ],
      ],
      resizeKeyboard: true,
      oneTimeKeyboard: true,
    );
    var keyboardStartRel = td.ReplyKeyboardMarkup(
      keyboard: [
        [
          td.KeyboardButton(text: 'از کاشان'),
          td.KeyboardButton(text: 'از اصفهان'),
        ],
        [
          td.KeyboardButton(text: 'از رشت'),
          td.KeyboardButton(text: 'نمی‌دونم که!'),
        ],
      ],
      resizeKeyboard: true,
      oneTimeKeyboard: true,
    );
    var keyboardSarbazi = td.ReplyKeyboardMarkup(
      keyboard: [
        [
          td.KeyboardButton(text: 'روز های دوری'),
          td.KeyboardButton(text: 'نه ادامه بده'),
        ],
      ],
      resizeKeyboard: true,
      oneTimeKeyboard: true,
    );
    var keyboardEnding = td.ReplyKeyboardMarkup(
      keyboard: [
        [td.KeyboardButton(text: 'بسه فیلم هندی، ادامه بده')],
      ],
      resizeKeyboard: true,
      oneTimeKeyboard: true,
    );
    var keyboardSpecial = td.ReplyKeyboardMarkup(
      keyboard: [
        [td.KeyboardButton(text: "Yes, my love ❤️✨")],
        [td.KeyboardButton(text: "نه، من فقط می‌خوام بخوابم 😴")],
        [td.KeyboardButton(text: "نه ما بدرد هم نمی‌خوریم 🔪")],
      ],
      resizeKeyboard: true,
      oneTimeKeyboard: true,
    );

    message.reply(
      '*سلام* 🎀 *هپینس* 🎀 قشنگم \n\n'
      'این ربات مخصوص قشنگ‌ترین دختر زندگیم ساخته شده💖 \n'
      'دوس داری یه قصه بشنوی؟',
      parseMode: 'MarkdownV2',
      replyMarkup: keyboardRead,
    );
    Future.delayed(const Duration(milliseconds: 300), () {
      teledart.sendAudio(
        chatId,
        "https://dl.melovy.ir/2022/03/Ed-Sheeran-Perfect1.mp3",
        title: 'Perfect - Ed Sheeran',
        performer: 'Ed Sheeran',
        caption: '🎵 برای لحظات عاشقانمون ❤️',
      );
    });
    teledart.onMessage().listen((message) {
      if (message.text == 'معلومه که میخوام') {
        message.reply('آخجون برو بریم...!');
        Future.delayed(const Duration(milliseconds: 300), () {
          message.reply(AllMessage.message1, replyMarkup: keyboardStartRel);
        });
      } else if (message.text == 'آره') {
        message.reply('ایششش برو بریم...!');
        Future.delayed(const Duration(milliseconds: 300), () {
          message.reply(AllMessage.message1, replyMarkup: keyboardStartRel);
        });
      }
    });
    teledart.onMessage().listen((message) {
      if (message.text == 'از کاشان') {
        message.reply('آفرین ببلی');
        Future.delayed(const Duration(milliseconds: 300), () async {
          await teledart.sendPhoto(
            chatId,
            "https://drive.google.com/uc?id=1BHsz95ukxSp79Eo7rP2fGA8LiUb4nLka",
            caption: 'شروع صمیمی شدنا 💕',
          );
          await teledart.sendPhoto(
            chatId,
            "https://drive.google.com/uc?id=1HchedGm4f55XUyzXo9_7hlqOu87vMkB7",
            caption: 'تو اتوبوس عکس مشترک با usb 💕',
          );
          await teledart.sendPhoto(
            chatId,
            "https://drive.google.com/uc?id=1BQ-PeY0hAcrgmv8cklt_ykxGXVHERLEs",
            caption: 'سایمون و اولین دیت بیرون غدا خوردن دوتایی',
          );
          await teledart.sendPhoto(
            chatId,
            "https://drive.google.com/uc?id=1yAc5FXMhrJt39EPEwk8JcGhpR0HUu-TQ",
            caption: 'ببلی وا داد',
          );
          await teledart.sendPhoto(
            chatId,
            "https://drive.google.com/uc?id=19myOnVe8FXaVw-wGcjlR3KpAdbeDUd_c",
            caption: 'کاشان زیبا 💕',
          );
          await teledart.sendPhoto(
            chatId,
            "https://drive.google.com/uc?id=1sLpsdtsh_D9Wfd64TYxru_3gs_l_B1l6",
            caption: 'هپینس رو برای خودم کردم 🎀',
          );
        }).then(
          ((value) =>
              message.reply(AllMessage.message2, replyMarkup: keyboardSarbazi)),
        );
      } else if (message.text == 'از اصفهان' || message.text == 'از رشت') {
        message.reply('نخیررررر', replyMarkup: keyboardStartRel);
      } else if (message.text == 'نمی‌دونم که!') {
        message.reply('نمی‌دونم که یعنی چی؟', replyMarkup: keyboardStartRel);
      }
    });
    teledart.onMessage().listen((message) async {
      if (message.text == 'روز های دوری') {
        await teledart.sendPhoto(
          chatId,
          "https://drive.google.com/uc?id=1DuClZHRkSOxcXCL_SPE-NFKz6DLdTBbH",
          caption: 'نازجان بانوی قشنگم',
        );
        await teledart.sendPhoto(
          chatId,
          "https://drive.google.com/uc?id=1jJMnioS7Yg3AHfioT7B6QUnR0RlVQh3F",
          caption: 'دوس پسر سرباز',
        );
        await teledart.sendPhoto(
          chatId,
          "https://drive.google.com/uc?id=1OROVEq-T3adZFdm6cDsrQd-G-rwfbM7n",
          caption: 'روزای دوری باهم بودمون',
        );
        await teledart.sendPhoto(
          chatId,
          "https://drive.google.com/uc?id=170Pbo6VkF8BWFqfT8Uh2ZWYk5y6IKiTF",
          caption: "تماس تصویری",
        );
        await teledart.sendVideo(
          chatId,
          "https://drive.google.com/uc?id=1RNgaelE4Kk-ig3xVl7rn3rcrGnRU7Iur",
          caption: "ببلی قشنگم و روزای سختش",
        );
        await teledart.sendVideo(
          chatId,
          "https://drive.google.com/uc?id=1LbJKn17cw7hhu3aufze-BDKHFjLR8jVb",
          caption: "ببلی قشنگم و روزای سختش",
        );
        Future.delayed(const Duration(milliseconds: 600), () {
          message.reply(AllMessage.message3, replyMarkup: keyboardEnding);
        });
      } else if (message.text == 'نه ادامه بده') {
        message.reply('باشه قشنگم');
        Future.delayed(const Duration(milliseconds: 300), () {
          message.reply(AllMessage.message4);
        });

        Future.delayed(const Duration(milliseconds: 2000), () {
          message.reply(
            AllMessage.specialMessage,
            replyMarkup: keyboardSpecial,
          );
        });
      }
    });
    teledart.onMessage().listen((message) {
      if (message.text == 'بسه فیلم هندی، ادامه بده') {
        message.reply(AllMessage.message4);
        Future.delayed(const Duration(milliseconds: 1500), () {
          message.reply(
            AllMessage.specialMessage,
            replyMarkup: keyboardSpecial,
          );
        });
      }
    });
    teledart.onMessage().listen((message) {
      if (message.text == 'نه، من فقط می‌خوام بخوابم 😴') {
        teledart.sendSticker(
          chatId,
          'CAACAgIAAxkBAAEzTUdn7TB2OYzYYIakYi95tNm7MsBaZwACWwADUomRI83TinWyLEDgNgQ',
        );
        Future.delayed(const Duration(milliseconds: 300), () {
          message.reply(
            "منطورم اینه با تو بخوابم\n ${AllMessage.specialMessage}",
            replyMarkup: keyboardSpecial,
          );
        });
      } else if (message.text == 'نه ما بدرد هم نمی‌خوریم 🔪') {
        teledart.sendSticker(
          chatId,
          'CAACAgIAAxkBAAEzTUln7TD4znassPtztfMut-ZtnwbHoQACSQADUomRI4zdJVjkz_fvNgQ',
        );
        Future.delayed(const Duration(milliseconds: 300), () {
          message.reply(
            "مرض دارم شوخی کردم باهات\n ${AllMessage.specialMessage}",
            replyMarkup: keyboardSpecial,
          );
        });
      } else if (message.text == 'Yes, my love ❤️✨') {
        teledart.sendSticker(
          chatId,
          'CAACAgIAAxkBAAEzTV1n7TJk_6ksy25DvcPWXdETkaoXUAAC_wADVp29Ctqt-n3kvEAkNgQ',
        );

        Future.delayed(const Duration(milliseconds: 300), () {
          teledart.sendAudio(
            chatId,
            "https://dls.musics-fa.com/tagdl/ali/Mohsen%20Chavoshi%20-%20Babe%20Delami%20(320).mp3",
            title: 'babe delami - Mohsen Chavoshi',
            performer: 'Mohsen Chavoshi',
            caption: '🎵 من خیلی دوست دارم❤️',
          );
        });
      }
    });
  });
}
