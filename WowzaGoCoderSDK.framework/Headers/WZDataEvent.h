//
//  WZDataEvent.h
//  WowzaGoCoderSDK
//
//  Copyright 2007 – 2016, Wowza Media Systems, LLC.  All rights
//  reserved.
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
//  OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
//  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
//  OTHER DEALINGS IN THE SOFTWARE.
//

#import <Foundation/Foundation.h>
#import <CoreMedia/CoreMedia.h>
#import "WZData.h"

typedef void (^WZDataEventCompletion)( WZDataItem * _Nullable result);

@interface WZDataEvent : NSObject

@property (nonatomic, strong, nullable) NSString *eventName;
@property (nonatomic, strong, nullable) WZDataMap *eventMapParams;
@property (nonatomic, strong, nullable) WZDataList *eventListParams;

- (nonnull instancetype) initWithName:(nonnull NSString *)name mapParams:(nonnull WZDataMap *)mapParams;
- (nonnull instancetype) initWithName:(nonnull NSString *)name listParams:(nonnull WZDataList *)listParams;

@end


