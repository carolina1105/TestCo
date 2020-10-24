////
////  Constant.swift
////  NapoleoN
////
////  Created by Napoleon Systems S.A.S on 18/11/19.
////  Copyright © 2019 Napoleon Systems S.A.S. All rights reserved.
////
//
import Foundation
//


//static let apiKey = "cc0cd24598a24f72a1cb05b581cddd3e" ======
//static let baseURL = "https://api.thecatapi.com/v1"  = SERVERURL
//static let fetchListOfBreeds = "/breeds" =====
//static let fetchImageByBreed = "/images/search?breed_ids=" =====
//static let fetchRandomImages = "/images/search" ======



//// Base Server Url Production
fileprivate let defServerUrl                   = "https://api.thecatapi.com/v1"
fileprivate let defEnvironmentType             = 2
//
//
//// Base Socket Url Production
//fileprivate let defSocketUrl                   = URL(string: "https://prod.napoleon-chat.com/broadcasting/auth")!
//fileprivate let defSocketKey                   = "6a11211af223541f2069"
//
//// Ice Servers Production
//fileprivate let defIceServers                  = [ "stun:stun-prod.napoleon-chat.com:3478",
//                                                   "turn:turn-prod.napoleon-chat.com:3478" ]
//
//fileprivate let defUsername                    = "wPJlHAYY"
//fileprivate let defCredentials                 = "GrI09zxkwFuOihIf"
//
//// Request Configurations
fileprivate let defApplication                 = "application/json"
fileprivate let defContentType                 = "Content-Type"
fileprivate let defLanguageIso                 = "languageIso"
fileprivate let defApiAuthKey                  = "X-API-Key"
fileprivate let defApiKey                         = "cc0cd24598a24f72a1cb05b581cddd3e"

fileprivate let defSocketID                    = "X-Socket-ID"
//
// End-points
fileprivate let defListBreeds = "/breeds"
fileprivate let defImageByBreed = "/images/search?breed_ids="
fileprivate let defRandomImages = "/images/search"
//fileprivate let defLogout                      = "/auth/logout"
//fileprivate let defUsers                       = "/users"
//fileprivate let defUsersSearch                 = "/users/search"
//fileprivate let defFriendship                  = "/friendship"
//fileprivate let defFriendshipSearch            = "/friendship/search"
//fileprivate let defFriendshipRequest           = "/friendshiprequest"
//fileprivate let defFriendshipReceived          = "/friendshiprequest/friendshipRequestReceived"
//fileprivate let defCountFriendshipReq          = "/friendshiprequest/countfriendshiprequest"
//fileprivate let defFriendshipBlock             = "/friendship/blockuser"
//fileprivate let defFriendshipUnblock           = "/friendship/unblockuser"
//fileprivate let defSilenceContact              = "/friendship/silence"
//fileprivate let defIsSilenceContact            = "/friendship/issilence"
//fileprivate let defMessages                    = "/messages"
//fileprivate let defAttachment                  = "/messages/attachment"
//fileprivate let defNotifyMessageReceivedUnread = "/messages/notifymessagereceivedunread"
//fileprivate let defMyMessages                  = "/messages/getmymessages"
//fileprivate let defMessagesByFriendship        = "/messages/getmessagesbyfriendship"
//fileprivate let defSendMessagesReaded          = "/messages/sendmessagesreaded"
//fileprivate let defVerifyMessagesReaded        = "/messages/verifymessagesreaded"
//fileprivate let defVerifyMessagesReceived      = "/messages/verifymessagesreceived"
//fileprivate let defReturnDestroyMessages       = "/destroymessages"
//fileprivate let defDestroyMessages             = "/destroymessages"
//fileprivate let defUpdate                      = "/users/update"
//fileprivate let defContactUs                   = "/pqrs"
//fileprivate let defQuestions                   = "/questions"
//fileprivate let defAnswers                     = "/inforecovery"
//fileprivate let defReturnQuestions             = "/inforecovery/getanswersinforecovery"
//fileprivate let defReturnQuestionsOldUser      = "/inforecovery/getanswersinforecoveryolduser"
//fileprivate let defVerifyAnswers               = "/inforecovery/validateanswers"
//fileprivate let defVerifyOldAnswers            = "/inforecovery/validateanswersolduser"
//fileprivate let defValidateOldPassword         = "/inforecovery/validateoldpassword"
//fileprivate let defBlockattacker               = "/inforecovery/blockattacker"
//fileprivate let defSubscriptions               = "/subscriptions"
//fileprivate let defCreateGangway               = "/paypal/createpayment"
//fileprivate let defCurrentSubscription         = "/payments/ultimatepayment"
//fileprivate let defSubscriptionState           = "/subscriptions/state"
//fileprivate let defCancelSubscription          = "/subscriptions/cancel"
//fileprivate let defCallfriend                  = "/call/callfriend"
//fileprivate let defRejectCall                  = "/call/rejectedcall"
//fileprivate let defCancelCall                  = "/call/cancelcall"
//
//// Socket Events
//fileprivate let defSubscribe                   = "subscribe"
//fileprivate let defUnsubscribe                 = "unsubscribe"
//fileprivate let defSubsSuccess                 = "pusher:subscription_succeeded"
//fileprivate let defSubsConnected               = "pusher:connection_established"
//fileprivate let defSubsError                   = "pusher:subscription_error"
//fileprivate let defConnect                     = "connect"
//fileprivate let defDisconnect                  = "disconnect"
//fileprivate let defConnectError                = "connect_error"
//fileprivate let defClientCallNN                = "client-callNN"
//fileprivate let defNewMessageEvent             = "App\\Events\\NewMessageEvent"
//fileprivate let defCallFriendEvent             = "App\\Events\\CallFriendEvent"
//fileprivate let defRejectedCallEvent           = "App\\Events\\RejectedCallEvent"
//fileprivate let defNotifyMessageReaded         = "App\\Events\\NotifyMessageReaded"
//fileprivate let defNotifyMessagesReceived      = "App\\Events\\NotifyMessagesReceived"
//fileprivate let defNotifyMessagesDestroy       = "App\\Events\\SendMessagesDestroyEvent"
//fileprivate let defCancelledCall               = "App\\Events\\CancelCallEvent"
//fileprivate let defBlockOrDeleteFrienship      = "App\\Events\\BlockOrDeleteFrienshipEvent"
//
//// Encryption And Decryption Keys
//fileprivate let defPublicKey                   = "c6a45c9c226f72230c4fa1bd4d67f06687a97614"
fileprivate let defSecretKey                   = "SecretKey"
//
//// Terms And Conditions
//fileprivate let defTerms                       = "https://www.napoleonsecretchat.com/privacidad/"
//
//// In-App Purchase Shared Secret
//fileprivate let defSharedSecret                = "d7aa80c94bb346f8b4a2ad9bc813e4d8"
//
struct Constant {
    let serverUrl                   : String
    let environmentType             : Int
//    let socketUrl                   : URL
//    let socketKey                   : String
//    let iceServers                  : [String]
//    let username                    : String
//    let credentials                 : String
    let application                 : String
    let contentType                 : String
    let languageIso                 : String
    let apiAuthKey                  : String
    let apiKey                      : String
    let socketID                    : String
    let listBreeds                  : String
    let imageByBreed                : String
    let randomImages                : String
//    let generateCode                : String
//    let verificateCode              : String
//    let validateNick                : String
//    let logout                      : String
//    let users                       : String
//    let usersSearch                 : String
//    let friendship                  : String
//    let friendshipSearch            : String
//    let friendshipRequest           : String
//    let friendshipReceived          : String
//    let friendshipBlock             : String
//    let friendshipUnblock           : String
//    let silenceContact              : String
//    let isSilenceContact            : String
//    let countFriendshipReq          : String
//    let messages                    : String
//    let attachment                  : String
//    let notifyMessageReceivedUnread : String
//    let myMessages                  : String
//    let messagesByFriendship        : String
//    let sendMessagesReaded          : String
//    let verifyMessagesReaded        : String
//    let verifyMessagesReceived      : String
//    let returnDestroyMessages       : String
//    let destroyMessages             : String
//    let update                      : String
//    let contactUs                   : String
//    let questions                   : String
//    let answers                     : String
//    let returnQuestions             : String
//    let returnQuestionsOldUser      : String
//    let verifyAnswers               : String
//    let VerifyOldAnswers            : String
//    let validateOldPassword         : String
//    let blockattacker               : String
//    let callfriend                  : String
//    let rejectCall                  : String
//    let cancelCall                  : String
//    let subscribe                   : String
//    let unsubscribe                 : String
//    let subsSuccess                 : String
//    let subsConnected               : String
//    let subsError                   : String
//    let connect                     : String
//    let disconnect                  : String
//    let connectError                : String
//    let clientCallNN                : String
//    let newMessageEvent             : String
//    let callFriendEvent             : String
//    let rejectedCallEvent           : String
//    let notifyMessageReaded         : String
//    let notifyMessagesReceived      : String
//    let notifyMessagesDestroy       : String
//    let cancelledCall               : String
//    let blockOrDeleteFrienship      : String
//    let pulicKey                    : String
    let secretKey                   : String
//    let subscriptions               : String
//    let createGangway               : String
//    let currentSubscription         : String
//    let subscriptionState           : String
//    let cancelSubscription          : String
//    let terms                       : String
//    let sharedSecret                : String
//
    static let `default` = Constant(serverUrl                   : defServerUrl,
                                    environmentType             : defEnvironmentType,
//                                    socketUrl                   : defSocketUrl,
//                                    socketKey                   : defSocketKey,
//                                    iceServers                  : defIceServers,
//                                    username                    : defUsername,
//                                    credentials                 : defCredentials,
                                    application                 : defApplication,
                                    contentType                 : defContentType,
                                    languageIso                 : defLanguageIso,
                                    apiAuthKey                  : defApiAuthKey,
                                    apiKey                      : defApiKey,
                                    socketID                    : defSocketID,
                                    listBreeds                  : defListBreeds,
                                    imageByBreed                : defImageByBreed,
                                    randomImages                : defRandomImages,
//                                    generateCode                : defGenerateCode,
//                                    verificateCode              : defVerificateCode,
//                                    validateNick                : defValidateNick,
//                                    logout                      : defLogout,
//                                    users                       : defUsers,
//                                    usersSearch                 : defUsersSearch,
//                                    friendship                  : defFriendship,
//                                    friendshipSearch            : defFriendshipSearch,
//                                    friendshipRequest           : defFriendshipRequest,
//                                    friendshipReceived          : defFriendshipReceived,
//                                    friendshipBlock             : defFriendshipBlock,
//                                    friendshipUnblock           : defFriendshipUnblock,
//                                    silenceContact              : defSilenceContact,
//                                    isSilenceContact            : defIsSilenceContact,
//                                    countFriendshipReq          : defCountFriendshipReq,
//                                    messages                    : defMessages,
//                                    attachment                  : defAttachment,
//                                    notifyMessageReceivedUnread : defNotifyMessageReceivedUnread,
//                                    myMessages                  : defMyMessages,
//                                    messagesByFriendship        : defMessagesByFriendship,
//                                    sendMessagesReaded          : defSendMessagesReaded,
//                                    verifyMessagesReaded        : defVerifyMessagesReaded,
//                                    verifyMessagesReceived      : defVerifyMessagesReceived,
//                                    returnDestroyMessages       : defReturnDestroyMessages,
//                                    destroyMessages             : defDestroyMessages,
//                                    update                      : defUpdate,
//                                    contactUs                   : defContactUs,
//                                    questions                   : defQuestions,
//                                    answers                     : defAnswers,
//                                    returnQuestions             : defReturnQuestions,
//                                    returnQuestionsOldUser      : defReturnQuestionsOldUser,
//                                    verifyAnswers               : defVerifyAnswers,
//                                    VerifyOldAnswers            : defVerifyOldAnswers,
//                                    validateOldPassword         : defValidateOldPassword,
//                                    blockattacker               : defBlockattacker,
//                                    callfriend                  : defCallfriend,
//                                    rejectCall                  : defRejectCall,
//                                    cancelCall                  : defCancelCall,
//                                    subscribe                   : defSubscribe,
//                                    unsubscribe                 : defUnsubscribe,
//                                    subsSuccess                 : defSubsSuccess,
//                                    subsConnected               : defSubsConnected,
//                                    subsError                   : defSubsError,
//                                    connect                     : defConnect,
//                                    disconnect                  : defDisconnect,
//                                    connectError                : defConnectError,
//                                    clientCallNN                : defClientCallNN,
//                                    newMessageEvent             : defNewMessageEvent,
//                                    callFriendEvent             : defCallFriendEvent,
//                                    rejectedCallEvent           : defRejectedCallEvent,
//                                    notifyMessageReaded         : defNotifyMessageReaded,
//                                    notifyMessagesReceived      : defNotifyMessagesReceived,
//                                    notifyMessagesDestroy       : defNotifyMessagesDestroy,
//                                    cancelledCall               : defCancelledCall,
//                                    blockOrDeleteFrienship      : defBlockOrDeleteFrienship,
//                                    pulicKey                    : defPublicKey,
                                    secretKey                   : defSecretKey
//                                    subscriptions               : defSubscriptions,
//                                    createGangway               : defCreateGangway,
//                                    currentSubscription         : defCurrentSubscription,
//                                    subscriptionState           : defSubscriptionState,
//                                    cancelSubscription          : defCancelSubscription,
//                                    terms                       : defTerms,
//                                    sharedSecret                : defSharedSecret
                                    )
}
