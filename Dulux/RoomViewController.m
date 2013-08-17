//
//  RoomViewController.m
//  Dulux
//
//  Created by Emptymind on 8/8/13.
//  Copyright (c) 2013 dangdang. All rights reserved.
//

#import "RoomViewController.h"
#import "UIRoundRectView.h"
#import "AutoLayoutHelper.h"
#import "AppDelegate.h"

#import "ShareSDK_v2.3.1/ShareSDK.framework/Headers/ShareSDK.h"
#import "WXApi.h"
#import "WBApi.h"
#import <TencentOpenAPI/QQApi.h>
#import <TencentOpenAPI/QQApiInterface.h>
#import <TencentOpenAPI/TencentOAuth.h>

@interface RoomViewController ()

@end

@implementation RoomViewController
{
    UIImageView* m_image_view_room;
    NSString* m_room_picture_name;
    
    NSMutableArray* m_button_views;
    NSMutableArray* m_colors;
    NSMutableArray* m_colored_room_picture_names;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        if (self.roomIndex == 0)
        {
            m_colors = [NSMutableArray arrayWithObjects:
                        [UIColor colorWithRed:1 green:1 blue:0 alpha:1],
                        [UIColor colorWithRed:1 green:0 blue:0 alpha:1],
                        [UIColor colorWithRed:1 green:0 blue:1 alpha:1],
                        [UIColor colorWithRed:0 green:1 blue:0 alpha:1],
                        nil];
            m_colored_room_picture_names = [NSMutableArray arrayWithObjects:
                                    @"room1colored",
                                    @"room1colored",
                                    @"room1colored",
                                    @"room1colored",
                                    nil];
            m_room_picture_name = @"room1";
        }
        else if(self.roomIndex == 1)
        {
            m_colors = [NSMutableArray arrayWithObjects:
                        [UIColor colorWithRed:1 green:1 blue:0 alpha:1],
                        [UIColor colorWithRed:1 green:0 blue:0 alpha:1],
                        [UIColor colorWithRed:1 green:0 blue:1 alpha:1],
                        [UIColor colorWithRed:0 green:1 blue:0 alpha:1],
                        nil];
            m_colored_room_picture_names = [NSMutableArray arrayWithObjects:
                                    @"room1colored",
                                    @"room1colored",
                                    @"room1colored",
                                    @"room1colored",
                                    nil];
            m_room_picture_name = @"room1";
        }
        else if(self.roomIndex == 2)
        {
            m_colors = [NSMutableArray arrayWithObjects:
                        [UIColor colorWithRed:1 green:1 blue:0 alpha:1],
                        [UIColor colorWithRed:1 green:0 blue:0 alpha:1],
                        [UIColor colorWithRed:1 green:0 blue:1 alpha:1],
                        [UIColor colorWithRed:0 green:1 blue:0 alpha:1],
                        nil];
            m_colored_room_picture_names = [NSMutableArray arrayWithObjects:
                                    @"room1colored",
                                    @"room1colored",
                                    @"room1colored",
                                    @"room1colored",
                                    nil];
            m_room_picture_name = @"room1";
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    m_image_view_room = [[UIImageView alloc] initWithImage:[UIImage imageNamed:m_room_picture_name]];
    m_image_view_room.translatesAutoresizingMaskIntoConstraints = false;
    m_image_view_room.contentMode = UIViewContentModeScaleToFill;
    m_image_view_room.userInteractionEnabled = true;
    [self.view addSubview:m_image_view_room];
    
    m_button_views = [[NSMutableArray alloc] init];
    for (int i=0; i<m_colors.count; i++)
    {
        UIColor* fill_color = m_colors[i];
        UIRoundRectView* button = [[UIRoundRectView alloc] init];
        button.frame = CGRectMake(0, 0, 100, 100);
        button.fillColor = fill_color;
        button.strokeColor = [UIColor clearColor];
        button.backgroundColor = [UIColor clearColor];
        
        button.translatesAutoresizingMaskIntoConstraints = false;
        button.contentMode = UIViewContentModeScaleToFill;
        button.userInteractionEnabled = true;
        
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        [button addGestureRecognizer:singleTap];
        
        [self.view addSubview:button];
        [m_button_views addObject:button];
    }
    
    for (int i=0; i<m_button_views.count-1; i++)
    {
        UIView* button1 = m_button_views[i];
        UIView* button2 = m_button_views[i+1];
        [self.view addConstraint:[AutoLayoutHelper viewEqualsToAnother:button1 another:button2 attr:NSLayoutAttributeWidth]];
        [self.view addConstraint:[AutoLayoutHelper viewEqualsToAnother:button1 another:button2 attr:NSLayoutAttributeHeight]];
        [self.view addConstraint:[AutoLayoutHelper viewEqualsToAnother:button1 another:button2 attr:NSLayoutAttributeLeft]];
        [self.view addConstraint:[AutoLayoutHelper viewOffsetsToAnother:button2 another:button1 attr:NSLayoutAttributeTop anotherAttr:NSLayoutAttributeBottom offset:50]];
    }
    [self.view addConstraint:[AutoLayoutHelper viewEqualsToNumber:m_button_views[0] number:100 attr:NSLayoutAttributeWidth]];
    [self.view addConstraint:[AutoLayoutHelper viewEqualsToNumber:m_button_views[0] number:100 attr:NSLayoutAttributeHeight]];
    [self.view addConstraint:[AutoLayoutHelper viewOffsetsToAnother:m_button_views[0] another:self.view attr:NSLayoutAttributeRight anotherAttr:NSLayoutAttributeRight offset:-100]];
    [self.view addConstraint:[AutoLayoutHelper viewOffsetsToAnother:m_button_views[0] another:self.view attr:NSLayoutAttributeTop anotherAttr:NSLayoutAttributeTop offset:100]];
    
    //constraints for room image:
    [self.view addConstraint:[AutoLayoutHelper viewOffsetsToAnother:m_image_view_room another:self.view attr:NSLayoutAttributeLeft anotherAttr:NSLayoutAttributeLeft offset:100]];
    [self.view addConstraint:[AutoLayoutHelper viewOffsetsToAnother:m_image_view_room another:self.view attr:NSLayoutAttributeTop anotherAttr:NSLayoutAttributeTop offset:200]];
    [self.view addConstraint:[AutoLayoutHelper viewEqualsToNumber:m_image_view_room number:400 attr:NSLayoutAttributeWidth]];
    [self.view addConstraint:[AutoLayoutHelper viewEqualsToNumber:m_image_view_room number:250 attr:NSLayoutAttributeHeight]];

   UIButton* sina_weibo_button = [[UIButton alloc] init];
   sina_weibo_button.frame = CGRectMake(0, 0, 60, 30);
   [sina_weibo_button setTitle:@"SinaWeibo" forState:UIControlStateNormal];
   [sina_weibo_button addTarget:self action:@selector(shareToSinaWeibo:) forControlEvents:UIControlEventTouchUpInside];
   [self.view addSubview:sina_weibo_button];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)handleTap:(UITapGestureRecognizer *)tapRecognizer
{
    for (int i=0; i<m_button_views.count; i++)
    {
        UIView* button = m_button_views[i];
        if (button == tapRecognizer.view)
        {
            NSString* pic_name = m_colored_room_picture_names[i];
            m_image_view_room.image = [UIImage imageNamed:pic_name];
            break;
        }
    }
}

- (void) shareToSinaWeibo:(id)sender
{
   AppDelegate* _appDelegate = (AppDelegate *)([UIApplication sharedApplication].delegate);
   
   //创建分享内容
   NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"room1colored" ofType:@"png"];
   id<ISSContent> publishContent = [ShareSDK content:@"test1"
                                      defaultContent:@""
                                               image:[ShareSDK imageWithPath:imagePath]
                                               title:nil
                                                 url:nil
                                         description:nil
                                           mediaType:SSPublishContentMediaTypeText];
   
   //创建弹出菜单容器
   id<ISSContainer> container = [ShareSDK container];
   [container setIPadContainerWithView:sender arrowDirect:UIPopoverArrowDirectionUp];
   
   id<ISSAuthOptions> authOptions = [ShareSDK authOptionsWithAutoAuth:YES
                                                        allowCallback:YES
                                                        authViewStyle:SSAuthViewStyleFullScreenPopup
                                                         viewDelegate:nil
                                              authManagerViewDelegate:_appDelegate.viewDelegate];
   //在授权页面中添加关注官方微博
   /*[authOptions setFollowAccounts:[NSDictionary dictionaryWithObjectsAndKeys:
    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
    SHARE_TYPE_NUMBER(ShareTypeSinaWeibo),
    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
    SHARE_TYPE_NUMBER(ShareTypeTencentWeibo),
    nil]];*/
   
   //显示分享菜单
   [ShareSDK showShareViewWithType:ShareTypeSinaWeibo
                         container:container
                           content:publishContent
                     statusBarTips:YES
                       authOptions:authOptions
                      shareOptions:[ShareSDK defaultShareOptionsWithTitle:nil
                                                          oneKeyShareList:nil//[NSArray defaultOneKeyShareList]
                                                           qqButtonHidden:YES
                                                    wxSessionButtonHidden:YES
                                                   wxTimelineButtonHidden:YES
                                                     showKeyboardOnAppear:NO
                                                        shareViewDelegate:_appDelegate.viewDelegate
                                                      friendsViewDelegate:_appDelegate.viewDelegate
                                                    picViewerViewDelegate:nil]
                            result:^(ShareType type, SSPublishContentState state, id<ISSStatusInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                               if (state == SSPublishContentStateSuccess)
                               {
                                  NSLog(@"发表成功");
                               }
                               else if (state == SSPublishContentStateFail)
                               {
                                  NSLog(@"发布失败!error code == %d, error code == %@", [error errorCode], [error errorDescription]);
                               }
                            }];
   
   /*
   
   
   id<ISSAuthOptions> authOptions = [ShareSDK authOptionsWithAutoAuth:YES
                                                        allowCallback:YES
                                                        authViewStyle:SSAuthViewStyleFullScreenPopup
                                                         viewDelegate:nil
                                              authManagerViewDelegate:_appDelegate.viewDelegate];
   
   //在授权页面中添加关注官方微博
   [authOptions setFollowAccounts:[NSDictionary dictionaryWithObjectsAndKeys:
                                   [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                   SHARE_TYPE_NUMBER(ShareTypeSinaWeibo),
                                   [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                   SHARE_TYPE_NUMBER(ShareTypeTencentWeibo),
                                   nil]];
   
   [ShareSDK followUserWithType:ShareTypeTencentWeibo
                          field:@"ShareSDK"
                      fieldType:SSUserFieldTypeName
                    authOptions:authOptions
                   viewDelegate:_appDelegate.viewDelegate
                         result:^(SSResponseState state, id<ISSUserInfo> userInfo, id<ICMErrorInfo> error) {
                            NSString *msg = nil;
                            if (state == SSResponseStateSuccess)
                            {
                               msg = @"关注成功";
                            }
                            else if (state == SSResponseStateFail)
                            {
                               msg = [NSString stringWithFormat:@"关注失败:%@", error.errorDescription];
                            }
                            
                            if (msg)
                            {
                               UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示"
                                                                                   message:msg
                                                                                  delegate:nil
                                                                         cancelButtonTitle:@"知道了"
                                                                         otherButtonTitles:nil];
                               [alertView show];
                            }
                         }];
    */
}


@end
