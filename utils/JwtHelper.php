<?php
// utils/JwtHelper.php

class JwtHelper
{

    // ดึง Secret Key จาก Environment Variable
    private static function getSecret()
    {
        if (!isset($_ENV['JWT_SECRET'])) {
            throw new Exception("JWT_SECRET not found in .env");
        }
        return $_ENV['JWT_SECRET'];
    }

    // สร้าง Token (Encode)
    public static function encode($payload)
    {
        $header = json_encode(['typ' => 'JWT', 'alg' => 'HS256']);
        $payload = json_encode($payload);

        // แปลงเป็น Base64Url (ตัด +, /, = ออก)
        $base64UrlHeader = str_replace(['+', '/', '='], ['-', '_', ''], base64_encode($header));
        $base64UrlPayload = str_replace(['+', '/', '='], ['-', '_', ''], base64_encode($payload));

        // เซ็นลายเซ็น (Signature)
        $signature = hash_hmac('sha256', $base64UrlHeader . "." . $base64UrlPayload, self::getSecret(), true);
        $base64UrlSignature = str_replace(['+', '/', '='], ['-', '_', ''], base64_encode($signature));

        return $base64UrlHeader . "." . $base64UrlPayload . "." . $base64UrlSignature;
    }

    // อ่าน Token (Decode)
    public static function decode($token)
    {
        $parts = explode('.', $token);
        if (count($parts) != 3)
            return null;

        $header = $parts[0];
        $payload = $parts[1];
        $signatureProvided = $parts[2];

        // ตรวจสอบลายเซ็นว่าตรงกันไหม
        $signature = hash_hmac('sha256', $header . "." . $payload, self::getSecret(), true);
        $base64UrlSignature = str_replace(['+', '/', '='], ['-', '_', ''], base64_encode($signature));

        if ($base64UrlSignature !== $signatureProvided)
            return null;

        // ถ้าตรง ให้แกะ Payload ออกมา
        $payloadDecoded = base64_decode(str_replace(['-', '_'], ['+', '/'], $payload));
        return json_decode($payloadDecoded, true);
    }
}