//
//  ViewController.m
//  UI_example
//
//  Created by Hristo Borisov on 9/15/15.
//  Copyright (c) 2015 Hristo Borisov. All rights reserved.
//

#import "ViewController.h"
#include <stdlib.h>
#include "hidapi.h"

@implementation ViewController

int res;
unsigned char buf[65];
#define MAX_STR 255
wchar_t wstr[MAX_STR];
hid_device *handle;
int i;

- (void)viewDidLoad {
    [super viewDidLoad];

    /*
    int res;
    unsigned char buf[65];
#define MAX_STR 255
    wchar_t wstr[MAX_STR];
    hid_device *handle;
    int i;
    */
    
    // Enumerate and print the HID devices on the system
    struct hid_device_info *devs, *cur_dev;
    
    devs = hid_enumerate(0x0, 0x0);
    cur_dev = devs;
    while (cur_dev) {
        printf("Device Found\n  type: %04hx %04hx\n  path: %s\n  serial_number: %ls",
               cur_dev->vendor_id, cur_dev->product_id, cur_dev->path, cur_dev->serial_number);
        printf("\n");
        printf("  Manufacturer: %ls\n", cur_dev->manufacturer_string);
        printf("  Product:      %ls\n", cur_dev->product_string);
        printf("\n");
        cur_dev = cur_dev->next;
    }
    hid_free_enumeration(devs);
    
    
    // Open the device using the VID, PID,
    // and optionally the Serial number.
    handle = hid_open(0x04d8, 0x003f, NULL);
    
    if ( handle != NULL ) {
        // Read the Manufacturer String
        res = hid_get_manufacturer_string(handle, wstr, MAX_STR);
        printf("Manufacturer String: %ls\n", wstr);
        
        // Read the Product String
        res = hid_get_product_string(handle, wstr, MAX_STR);
        printf("Product String: %ls\n", wstr);
        
        // Read the Serial Number String
        res = hid_get_serial_number_string(handle, wstr, MAX_STR);
        printf("Serial Number String: %ls", wstr);
        printf("\n");
        
        // Send a Feature Report to the device
        buf[0] = 0x2; // First byte is report number
        buf[1] = 0xa0;
        buf[2] = 0x0a;
        res = hid_send_feature_report(handle, buf, 17);
        
        // Read a Feature Report from the device
        buf[0] = 0x2;
        res = hid_get_feature_report(handle, buf, sizeof(buf));
        
        // Print out the returned buffer.
        printf("Feature Report\n   ");
        for (i = 0; i < res; i++)
            printf("%02hhx ", buf[i]);
        printf("\n");
        
        // Set the hid_read() function to be non-blocking.
        hid_set_nonblocking(handle, 1);
        

    }
        //    unsigned char command = 0x30;
    //buf[0] = 0x61;
    
    //hid_write(handle, buf, 65);
    /*
     
     // Send an Output report to toggle the LED (cmd 0x80)
     buf[0] = 1; // First byte is report number
     buf[1] = 0x80;
     res = hid_write(handle, buf, 65);
     
     // Send an Output report to request the state (cmd 0x81)
     buf[1] = 0x81;
     hid_write(handle, buf, 65);
     
     // Read requested state
     res = hid_read(handle, buf, 65);
     if (res < 0)
     printf("Unable to read()\n");
     
     // Print out the returned buffer.
     for (i = 0; i < res; i++)
     printf("buf[%d]: %d\n", i, buf[i]);
     */

    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)click:(id)sender {
    
    NSString * title = [sender title];
    NSInteger isOne = [@"1" isEqualToString:title];
    NSInteger isTwo = [@"2" isEqualToString:title];
    NSInteger isThree = [@"3" isEqualToString:title];
    NSInteger isFour = [@"4" isEqualToString:title];
    NSInteger isFive = [@"5" isEqualToString:title];
    NSInteger isSix = [@"6" isEqualToString:title];
    NSInteger isSeven = [@"7" isEqualToString:title];
    NSInteger isEight = [@"8" isEqualToString:title];
    NSInteger isNine = [@"9" isEqualToString:title];
    
    if (isOne) {
        if ([sender state] == NSOnState) {
            buf[0] = 0x80;
            hid_write(handle, buf, 65);
        } else {
            buf[0] = 0x81;
            hid_write(handle, buf, 65);
        }
    } else if (isTwo) {
        if ([sender state] == NSOnState) {
            buf[0] = 0x70;
            hid_write(handle, buf, 65);
        } else {
            buf[0] = 0x71;
            hid_write(handle, buf, 65);
        }
    } else if (isThree) {
        if ([sender state] == NSOnState) {
            buf[0] = 0x60;
            hid_write(handle, buf, 65);
        } else {
            buf[0] = 0x61;
            hid_write(handle, buf, 65);
        }
    } else if (isFour) {
        if ([sender state] == NSOnState) {
            buf[0] = 0x50;
            hid_write(handle, buf, 65);
        } else {
            buf[0] = 0x51;
            hid_write(handle, buf, 65);
        }
    } else if (isFive) {
        if ([sender state] == NSOnState) {
            buf[0] = 0x40;
            hid_write(handle, buf, 65);
        } else {
            buf[0] = 0x41;
            hid_write(handle, buf, 65);
        }
    } else if (isSix) {
        if ([sender state] == NSOnState) {
            buf[0] = 0x30;
            hid_write(handle, buf, 65);
        } else {
            buf[0] = 0x31;
            hid_write(handle, buf, 65);
        }
    } else if (isSeven) {
        if ([sender state] == NSOnState) {
            buf[0] = 0x20;
            hid_write(handle, buf, 65);
        } else {
            buf[0] = 0x21;
            hid_write(handle, buf, 65);
        }
    } else if (isEight) {
        if ([sender state] == NSOnState) {
            buf[0] = 0x10;
            hid_write(handle, buf, 65);
        } else {
            buf[0] = 0x11;
            hid_write(handle, buf, 65);
        }
    } else if (isNine) {
        if ([sender state] == NSOnState) {
        } else {
        }
    }
    
    
}


@end
