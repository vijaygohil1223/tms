<?php
  require 'vendor/autoload.php';
  use \Mailjet\Resources;
  $mj = new \Mailjet\Client('3efaa57c4b8abc7e48828126b802720f','7a593f51ca6285bc96d548223414144b',true,['version' => 'v3.1']);
  $body = [
    'Messages' => [
      [
        'From' => [
          'Email' => "anil.kanhasoft@gmail.com",
          'Name' => "Anil"
        ],
        'To' => [
          [
              'Email' => "anil.kanhasoft@gmail.com",
              'Name' => "passenger 1"
          ],
          [
              'Email' => "tms.kanhasoft@gmail.com",
              'Name' => "passenger 1"
          ]
      ],
      'Cc' => [
          [
              'Email' => "satendra.kanhasoft@gmail.com",
              'Name' => "Copilot"
          ]
      ],
      'Bcc' => [
          [
              'Email' => "anils7016@gmail.com",
              'Name' => "Air traffic control"
          ]
      ],
      'Subject' => "Why i am getting this email",
      'TextPart' => "Why i am getting this email ?",
      'HTMLPart' => "<h3>Dear reader, You have received this mail. Because I have send it. <a href=\"https://www.kanhasoft.com/\">Kanhasoft</a>!</h3><br />Do not worry!"
  ]
]
];
  $response = $mj->post(Resources::$Email, ['body' => $body]);
  echo "<pre>";
  $response->success() && var_dump($response->getData());

?>
